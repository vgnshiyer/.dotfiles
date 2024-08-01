#!/bin/sh

codes="code"

style_file="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/out/vs/workbench/workbench.desktop.main.css"

if [ -f "$style_file" ]; then
    favorite="Zed Mono Extended"

    # Change font to monospace.
    sed -i "s/\.linux{[^}]\+/.linux{font-family:\"$favorite\",\"Noto Sans Mono\"/" \
        "$style_file"
    sed -i "s/\.linux:lang(zh-Hans){[^}]\+/.linux:lang(zh-Hans){font-family:\"$favorite\",\"Noto Sans Mono CJK SC\"/" \
        "$style_file"
    sed -i "s/\.linux:lang(zh-Hant){[^}]\+/.linux:lang(zh-Hant){font-family:\"$favorite\",\"Noto Sans Mono CJK TC\"/" \
        "$style_file"
    sed -i "s/\.linux:lang(ja){[^}]\+/.linux:lang(ja){font-family:\"$favorite\",\"Noto Sans Mono CJK JP\"/" \
        "$style_file"
    sed -i "s/\.linux:lang(ko){[^}]\+/.linux:lang(ko){font-family:\"$favorite\",\"Noto Sans Mono CJK KR\"/" \
        "$style_file"

    # Change font-size to what you want.
    sed -i 's/\.monaco-workbench \.part>\.content{[^}]\+/.monaco-workbench .part>.content{font-size:18px/' \
        "$style_file"
fi

exit 0
