-- IMPORTANT: WATCH THIS VIDEO, to get how to configure this.
-- https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=6&ab_channel=chris%40machine
-- Neovim completions toturial 100% lua

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

--[[
this function helps our `super tab` work
what is `super tab`?
if you type fu and hit enter, you will get a function, first the cursor is on 1, type something, stay in insert mode and hit tab to get to 2 and then 3, if a pop up was open hit ctrl+e to close it and tab around.
you could choose between recommendations using tab.
  function ${1} (${2})
    -- ${3}
  then
--]]--
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    -- these two act like <C-u> and <C-d>
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),

    -- these two are for scrolling, if we get a very long pop up recommendations.
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

    -- like vscode this will open the popup with all of possible completions.
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

    -- ???
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

    -- when completions popup opens, we could close it
    -- i stands for insert mode
    -- c stands for command mode
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- super tab, for moving through options, and other things.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        -- jump in function thing explaind above ($1, $2, $3)
        luasnip.expand_or_jump()
      elseif check_backspace() then
        -- behave like regular tab
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  -- here we are saying that what we want in a line of completions popup:
  -- first an icon, the abbrivation like fu~, the menu (you could see menu thing below)
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },


  -- In case we have these three, the order of precedence will be luasnip, buffer and then path
  -- so luasnip will be at the top of list and then the others.
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- when we move through the recommendations popup, sometimes a second window open, that is called documentation window.
  window = {
    documentation = cmp.config.window.bordered(),
  },

  -- ghost-text is kind of like for instance if you start typing fu it will auto complete function for you and you could hit enter to accept it.
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}
