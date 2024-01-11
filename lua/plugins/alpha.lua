return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- local header = { 
    --     " ███▄▄▄▄    ▄████████   ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",     
    --     " ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",     
    --     " ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",    
    --     " ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",    
    --     " ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",     
    --     " ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",     
    --     " ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",     
    --     "  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",     
    --   }   
    
    local header = { 
     "███    █▄   ▄█           ███      ▄█    ▄▄▄▄███▄▄▄▄      ▄████████     ███        ▄████████ ",
     "███    ███ ███       ▀█████████▄ ███  ▄██▀▀▀███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███ ",
     "███    ███ ███          ▀███▀▀██ ███▌ ███   ███   ███   ███    ███    ▀███▀▀██   ███    █▀  ",
     "███    ███ ███           ███   ▀ ███▌ ███   ███   ███   ███    ███     ███   ▀  ▄███▄▄▄     ",
     "███    ███ ███           ███     ███▌ ███   ███   ███ ▀███████████     ███     ▀▀███▀▀▀     ",
     "███    ███ ███           ███     ███  ███   ███   ███   ███    ███     ███       ███    █▄  ",
     "███    ███ ███▌    ▄     ███     ███  ███   ███   ███   ███    ███     ███       ███    ███ ",
     "████████▀  █████▄▄██    ▄████▀   █▀    ▀█   ███   █▀    ███    █▀     ▄████▀     ██████████ ",
     "           ▀                                                                                ",
     "          ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄                   ",
     "          ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄                 ",
     "          ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███                 ",
     "          ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███                 ",
     "          ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███                 ",
     "          ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███                 ",
     "          ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███                 ",
     "           ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀                  ",
     "                                                                                            ",
    }
    local function footer()
      local plugins = require("lazy").stats().count
      local v = vim.version()
      return string.format(" v%d.%d.%d  󰂖 %s ", v.major, v.minor, v.patch, plugins)
    end

    

    dashboard.section.header.type = "text";
    dashboard.section.header.val = header;
    dashboard.section.header.opts = {
      position = "center",
      hl = "MyNeoVimHeader",
    }

    dashboard.section.footer.val = {
      footer()
    }
    dashboard.section.footer.opts = {
      position = "center",
      hl = "MyNeoVimFooter",
    }

    dashboard.section.buttons.val = {
      dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "p", "  Projects", ":Telescope projects <CR>"),
      dashboard.button( "s", "  Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
    }

    local thingy = io.popen('echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"')
    if thingy == nil then return end
    local date = thingy:read("*a")
    thingy:close()
    
    local datetime = os.date " %H:%M"

    local hi_top_section = {
      type = "text",
      val =  "┌────────────   Today is " .. date .. " ────────────┐",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }

    local hi_middle_section = {
      type = "text",
      val = "│                                                │",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }
    local hi_middle_section_msg = {
      type = "text",
      val = "│           The best config of Neovim            │",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }

    local hi_middle_section_ms_buildby = {
      type = "text",
      val = "│                    build by                    │",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }

    local hi_middle_section_ms_github = {
      type = "text",
      val = "│              @paulohsilvavieira                │",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }

    local hi_bottom_section = {
      type = "text",
      val = "└───══───══───══───  " .. datetime .. "  ───══───══───══────┘",
      opts = {
        position = "center",
        hl = "MyNeoVimHeaderInfo"
      }
    }

    local section = {
      header = dashboard.section.header,
      hi_top_section = hi_top_section,
      hi_middle_section = hi_middle_section,
      hi_middle_section_msg=hi_middle_section_msg,
      hi_middle_section_ms_github=hi_middle_section_ms_github,
      hi_middle_section_ms_buildby=hi_middle_section_ms_buildby,
      hi_bottom_section = hi_bottom_section,
      buttons = dashboard.section.buttons,
      footer = dashboard.section.footer,
    }

    local opts = {
      layout = {
        {type = "padding", val = 3},
        section.header,
        {type = "padding", val = 2},
        section.hi_top_section,
        section.hi_middle_section,
        section.hi_middle_section_msg,
        section.hi_middle_section_ms_buildby,
        section.hi_middle_section_ms_github,

        section.hi_middle_section,
        section.hi_bottom_section,
        {type = "padding", val = 2},
        section.buttons,
        {type = "padding", val = 2},
        section.footer,
      },
      opts = {
        margin = 5
      },
    }
    alpha.setup(opts)
  end
}
