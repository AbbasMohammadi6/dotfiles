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


For i3 you should have this config:\
`font pango:HackNerdFont 10`\
and this adds all icons in bumblebee and neovim\
