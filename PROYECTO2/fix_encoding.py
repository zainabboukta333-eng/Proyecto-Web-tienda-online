import os

replacements = {
    "Ã¡": "á",
    "Ã©": "é",
    "Ã­": "í",
    "Ã³": "ó",
    "Ãº": "ú",
    "Ã±": "ñ",
    "Ãš": "Ú",
    "Ã‘": "Ñ",
    "Ã ": "Á",
    "Ã‰": "É",
    "Ã ": "Í",
    "Ã“": "Ó",
    "â‚¬": "€",
    "âœ“": "✓",
    "â† ": "←",
    "ðŸŒ™": "🌙",
    "â˜€ï¸ ": "☀️",
    "â€¢": "•",
    "Â©": "©"
}

def fix_file(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        for key, value in replacements.items():
            content = content.replace(key, value)
        
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Fixed: {filepath}")
    except Exception as e:
        print(f"Error fixing {filepath}: {e}")

if __name__ == "__main__":
    for filename in os.listdir('.'):
        if filename.endswith('.html'):
            fix_file(filename)
