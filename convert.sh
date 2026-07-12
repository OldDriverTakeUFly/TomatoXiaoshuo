#!/bin/bash
# 番茄小说格式转换脚本
# 用法: ./convert.sh
# 将 03-正文/*.md 转换为 发布版/*.txt

SRC="03-正文"
DST="发布版"

for file in "$SRC"/*.md; do
  if [ -f "$file" ]; then
    filename=$(basename "$file" .md)
    output="$DST/${filename}.txt"
    
    sed -e 's/^#\+ //g' \
        -e 's/\*\*//g' \
        -e 's/\*//g' \
        -e 's/`//g' \
        -e '/^---$/d' \
        -e '/^```/d' \
        -e 's/★//g' \
        -e 's/✓/-/g' \
        -e 's/📌//g' \
        -e 's/🔥//g' \
        -e 's/🌸//g' \
        -e 's/⚔️//g' \
        -e 's/🍬//g' \
        -e 's/🪨//g' \
        -e 's/🐾//g' \
        -e 's/🎖️//g' \
        -e 's/💀//g' \
        -e 's/🐍//g' \
        -e 's/🏚️//g' \
        -e 's/🧭//g' \
        -e 's/🔥//g' \
        -e 's/👁️//g' \
        -e '/^|/d' \
        "$file" > "$output"
    
    echo "转换完成: $filename"
  fi
done

echo "---"
echo "全部转换完成，输出到 $DST/ 目录"
