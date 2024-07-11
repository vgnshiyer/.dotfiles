#!/usr/bin/env python3

import argparse
import os.path
import tzlocal
from typing import Any
from datetime import datetime, timedelta
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError

parser = argparse.ArgumentParser(description='TodoCal')
parser.add_argument('task_name', type=str,
                    help='Name of the task to add to the calendar')
parser.add_argument('--tomorrow', action='store_true',
                    help='Add task to tomorrow\'s calendar')


PROGRAM = os.path.realpath(__file__)
PROGRAM_DIR = os.path.dirname(PROGRAM)
SECRETS_DIR = f"{PROGRAM_DIR}/secrets"

SCOPES = ["https://www.googleapis.com/auth/calendar"]

event_template = {
    'summary': 'Event name',
    'start': {
    },
    'end': {
    }
}


def get_credentials():
    creds = None
    token_path = f"{SECRETS_DIR}/tokens.json"
    credentials_path = f"{SECRETS_DIR}/credentials.json"

    try:
        if os.path.exists(token_path):
            creds = Credentials.from_authorized_user_file(token_path)
    except Exception as e:
        print(f"Unknown error while parsing token.json file: {e}")

    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            try:
                creds.refresh(Request())
            except Exception as e:
                print("Refresh token expired.")
                flow = InstalledAppFlow.from_client_secrets_file(
                        credentials_path,
                        SCOPES
                )
                creds = flow.run_local_server(port=0)
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                    credentials_path,
                    SCOPES
            )
            creds = flow.run_local_server(port=0)

    with open(token_path, "w") as token:
        token.write(creds.to_json())

    return creds


def create_todo_event(service: Any, task_name: str, is_tomorrow: bool):
    print(f'Creating task with name: {task_name}')

    today = datetime.now().date()

    if is_tomorrow:
        today += timedelta(days=1)
    today = today.isoformat()
    timezone = tzlocal.get_localzone_name()

    event_template["summary"] = task_name
    event_template["start"]["date"] = today
    event_template["end"]["date"] = today
    event_template["start"]["timeZone"] = timezone
    event_template["end"]["timeZone"] = timezone

    try:
        created_event = service.events().insert(
                calendarId="primary", body=event_template).execute()
        print(f"Task created: {created_event.get('htmlLink', '')}")
    except HttpError as e:
        print(f"An error occurred: {e}")


def main():
    args = parser.parse_args()
    task_name = args.task_name
    is_tomorrow = args.tomorrow

    creds = get_credentials()
    service = build("calendar", "v3", credentials=creds)

    create_todo_event(service, task_name, is_tomorrow)


if __name__ == "__main__":
    main()
