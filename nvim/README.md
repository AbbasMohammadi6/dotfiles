To add a new language server to nvim-lsp, first install the reqruired language server from by doing this:
:LspInstall
a plugin called mason will install the required package from npm on you machine.
go to nvim/lua/abbas/lsp/setting and create a file with the name of the language server that you just added.
go to nvim/lua/abbas/lsp/mason and add the name of your language server to the table at the beginnng of the table called servers.

add syntax hightlighting for something like prisma:
:TSInstall prisma

TO ADD THE HACK FONT, GO TO THEIRE REOP:
https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
DOWNLOAD IT, DOUBLE CLICK ON IT, AND CLICK INSTALL.

Install xclip to make nvim able to copy things to clipboard:
sudo apt-get install xclip 

In order to make search in files work, the `ripgrep` package should be installed.
https://github.com/BurntSushi/ripgrep

How to add styled components support:
npm install --save-dev typescript-styled-plugin
add a plugins section to your tsconfig.json
{
  "compilerOptions": {
    "plugins": [
      {
        "name": "typescript-styled-plugin"
      }
    ]
  }
}
