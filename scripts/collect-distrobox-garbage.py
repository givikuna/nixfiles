import sys
import os
import subprocess

distrobox_cmd = sys.argv[1]
bin_dir = sys.argv[2]
declared_boxes = set(sys.argv[3:])

def main():
    result = subprocess.run([distrobox_cmd, "list", "--no-color"], capture_output=True, text=True)
    lines = result.stdout.strip().split('\n')
    if len(lines) <= 1:
        return

    current_boxes = []
    for line in lines[1:]:
        parts = line.split('|')
        if len(parts) > 1:
            current_boxes.append(parts[1].strip())

    for box in current_boxes:
        if box not in declared_boxes:
            print(f"orphaned distrobox found: {box}.")
            print(f"removing {box}")

            subprocess.run([distrobox_cmd, "rm", "--force", box])

            if os.path.exists(bin_dir):
                for filename in os.listdir(bin_dir):
                    filepath = os.path.join(bin_dir, filename)
                    if os.path.isfile(filepath):
                        try:
                            with open(filepath, 'r', encoding='utf-8') as f:
                                content = f.read()
                            if f"distrobox-enter -n {box} " in content:
                                os.remove(filepath)
                                print(f"removed exported binary -> {filepath}")
                        except UnicodeDecodeError:
                            pass

if __name__ == "__main__":
    main()
