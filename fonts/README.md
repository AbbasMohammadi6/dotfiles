Create this file:\
`~/.config/fontconfig/fonts.conf`

and put this inside it:

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

 <match>
  <edit mode="prepend" name="family">
   <string>HackNerdFont</string>
   <string>Vazirmatn</string>
   <string>NotoColorEmoji</string>
  </edit>
 </match>

 <dir>~/.local/share/fonts</dir>
 <dir>/usr/share/fonts/</dir>

</fontconfig>
```


All your nerd font file names should start with "HackNerdFont", like this: \
`HackNerdFont-Bold.ttf`\
And all your vazir fonts should be like this:\
`Vazirmatn-Black.ttf`

Don't forget to change your terminal font to `Hack`

For i3 you should have this config:\
`font pango:HackNerdFont 10`\
and this adds all icons in bumblebee and neovim\

--------------

for emojis install this font:
```bash
sudo pacman -S noto-fonts-emoji
```
and then move the font from here
```bash
/usr/share/fonts/noto
```
to here:
```bash
/usr/share/fonts/noto
```
(the noto font was added in the above fonts.conf)
