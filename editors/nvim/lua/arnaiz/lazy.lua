local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
  print("Lazy is not installed")
  return
end

local plugins_status, plugins = pcall(require, "arnaiz.plugins")
if not plugins_status then
  print("The file plugins.lua doesn't exists")
  return
end

lazy.setup({
  spec = plugins,
  git = {
    url_format = "git@github.com:%s.git"
  }
})
