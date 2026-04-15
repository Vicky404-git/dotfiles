#!/usr/bin/env python3
import sys
import os
import colorsys

template = '''
        _,met$$$$$gg.
    ,g$$$$$$$$$$$$$$$P.
  ,g$$P""        """Y$$.".
 ,$$P'              `$$$.
',$$P       ,ggs.     `$$b:
`d$$'     ,$P"'   .    $$$
 $$P      d$'     ,    $$P
 $$:      $$.   -    ,d$$'
 $$;      Y$b._   _,d$P'
 Y$$.    `.`"Y$$$$P"'
 `$$b      "-.__
  `Y$$b
   `Y$$.
     `$$b.
       `Y$$b.
         `"Y$b._
             `""""
'''

name = sys.argv[1] if len(sys.argv) > 1 else "VICKY"
name_len = len(name)
name_idx = 0

output = ""
lines = template.strip('\n').split('\n')
max_y = len(lines)
# Find the longest line so we can calculate the X axis properly
max_x = max(len(line) for line in lines)

for y, line in enumerate(lines):
    for x, char in enumerate(line):
        if char not in [' ', '\n']:
            # Calculate the diagonal position (0.0 at top-left, 1.0 at bottom-right)
            diag_pos = (x / max_x + y / max_y) / 2
            
            # Map the hue: 0.65 is Deep Blue, 0.35 is Neon Green
            # As diag_pos increases, we smoothly subtract from blue towards green
            hue = 0.65 - (diag_pos * 0.30)
            
            r, g, b = [int(v * 255) for v in colorsys.hsv_to_rgb(hue, 1.0, 1.0)]
            
            # Inject the exact pixel's 24-bit color code
            output += f"\033[38;2;{r};{g};{b}m"
            
            # Drop in your name letter
            output += name[name_idx % name_len]
            name_idx += 1
        else:
            output += char
    output += "\n"

# Reset color at the end
output += "\033[0m"

save_path = os.path.expanduser("~/dotfiles/fastfetch/dynamic_debian.txt")
with open(save_path, "w") as f:
    f.write(output)

print(f"[*] Diagonal Blue-Green Gradient generated for '{name}'")
