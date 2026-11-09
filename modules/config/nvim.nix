{ pkgs, lib, ... }:

{
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "mocha";
                    transparent = true;
                };

                options = {
                    tabstop = 2;
                    shiftwidth = 2;
                    expandtab = true;
                };

                clipboard = {
                    enable = true;
                    registers = "unnamedplus";
                    providers = {
                        wl-copy.enable = true;
                        xclip.enable = true;
                    };
                };

                options.mouse = "a";

                maps = {
                    normal = {
                        "<C-b>" = {
                            action = "<cmd>Neotree toggle<cr>";
                            desc = "Toggle file explorer";
                        };
                        "<C-Tab>" = {
                            action = "<C-w>w";
                            desc = "Fokus zum naechsten Fenster";
                        };
                        "<C-h>".action = "<C-w>h";
                        "<C-j>".action = "<C-w>j";
                        "<C-k>".action = "<C-w>k";
                        "<C-l>".action = "<C-w>l";
                    };

                    terminal = {
                        "<C-Tab>" = {
                            action = "<C-\\><C-n><C-w>w";
                            desc = "Fokus zum naechsten Fenster";
                        };
                        "<C-h>".action = "<C-\\><C-n><C-w>h";
                        "<C-j>".action = "<C-\\><C-n><C-w>j";
                        "<C-k>".action = "<C-\\><C-n><C-w>k";
                        "<C-l>".action = "<C-\\><C-n><C-w>l";
                    };
                };

                session.nvim-session-manager = {
                    enable = true;
                    setupOpts.autoload_mode = "LastSession";
                };

                lsp.enable = true;

                languages = {
                    enableTreesitter = true;

                    nix.enable = true;
                    clang.enable = true;
                    python.enable = true;
                    zsh.enable = true;
                    lua.enable = true;
                };

                filetree.neo-tree = {
                        enable = true;
                        setupOpts.window.position = "right";
                };

                tabline.nvimBufferline.enable = true;

                git = {
                    enable = true;
                    gitsigns.enable = true;
                };

                terminal.toggleterm = {
                    enable = true;
                    mappings.open = "<C-t>";
                };

                debugger.nvim-dap = {
                    enable = true;
                    ui.enable = true;
                };

                binds.whichKey.enable = true;
            
                statusline.lualine.enable = true;
                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;

                luaConfigPost = ''
                    -- Beim Start Seitenleiste und Terminal oeffnen, Fokus zurueck auf den Text
                    vim.api.nvim_create_autocmd("VimEnter", {
                        callback = function()
                            vim.defer_fn(function()
                                vim.cmd("Neotree show")
                                vim.cmd("ToggleTerm direction=horizontal")
                                vim.cmd("stopinsert")
                                vim.cmd("wincmd k")
                            end, 200)
                        end,
                    })

                    -- :q im letzten Textfenster schliesst auch Seitenleiste und Terminal
                    vim.api.nvim_create_autocmd("QuitPre", {
                        callback = function()
                            local cur = vim.api.nvim_get_current_buf()
                            if vim.bo[cur].buftype ~= "" or vim.bo[cur].filetype == "neo-tree" then
                                return
                            end
                            -- bei ungespeicherten Aenderungen nichts schliessen, :q meldet sich dann selbst
                            if vim.bo[cur].modified then
                                return
                            end
                            local text_windows = 0
                            for _, w in ipairs(vim.api.nvim_list_wins()) do
                                local b = vim.api.nvim_win_get_buf(w)
                                if vim.bo[b].buftype == "" and vim.bo[b].filetype ~= "neo-tree" then
                                    text_windows = text_windows + 1
                                end
                            end
                            if text_windows > 1 then
                                return
                            end
                            for _, b in ipairs(vim.api.nvim_list_bufs()) do
                                if vim.api.nvim_buf_is_loaded(b)
                                    and (vim.bo[b].buftype == "terminal" or vim.bo[b].filetype == "neo-tree") then
                                    vim.cmd("silent! bwipeout! " .. b)
                                end
                            end
                        end,
                    })
                '';
            };
        };
    };
}