{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Add any additional packages you need, like LSP servers
      nodejs # For some LSP servers like tsserver
      rust-analyzer # Rust LSP
      clang # C/C++ LSP
      python3 # Python LSP
    ];

    plugins = with pkgs.vimPlugins; [
      # Plugin manager
      lazy-nvim

      # Treesitter and related plugins
      nvim-treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects

      # LSP and completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      lspkind-nvim

      # Telescope for fuzzy finding
      telescope-nvim
      plenary-nvim

      # UI enhancements
      lualine-nvim
      which-key-nvim

      # Other useful plugins
      vim-fugitive
      vim-commentary
      vim-surround
    ];

    extraConfig = ''
      set number
      set clipboard=unnamed
      set tabstop=4
      set shiftwidth=4
      set updatetime=300

      " Enable filetype detection and plugins
      filetype plugin indent on

      " Lua configuration
      lua <<EOF
      -- Lazy.nvim setup
      require("lazy").setup({
        -- List your plugins here
      })

      -- LSP setup
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Setup lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = { 'rust_analyzer', 'clangd', 'pyright' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end

      -- Telescope setup
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      })

      -- Keybindings
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })

      -- Lualine setup
      require('lualine').setup({
        options = {
          theme = 'auto',
        },
      })

      -- Which-key setup
      require("which-key").setup({})
      EOF
    '';
  };
}