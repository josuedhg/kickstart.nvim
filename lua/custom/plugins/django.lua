
require("custom.common")

-- Creating vim command for manage.py commands
local function django_m_exec(vim_cmd, django_cmd)
  vim.api.nvim_create_user_command(vim_cmd, function()
    local cmd = string.format("bel 10split term://python manage.py %s", django_cmd)
    vim.cmd(cmd)
    vim.cmd("startinsert")
  end, {})
end

-- This function should run just if we are in an django project
local function django_load()
  if File_exists("manage.py") then
    django_m_exec("DjangoRun", "runserver")
    django_m_exec("DjangoMakeMigrations", "makemigrations")
    django_m_exec("DjangoMigrate", "migrate")
    django_m_exec("DjangoTest", "test")
    django_m_exec("DjangoCreateSuperUser", "createsuperuser")

    -- starting django app
    vim.api.nvim_create_user_command("DjangoStartApp", function(args)
      local cmd = string.format("bel 10split term://python manage.py startapp %s", args.args)
      vim.cmd(cmd)
      vim.cmd("startinsert")
    end, {nargs="?"})
  end
end

-- Starting django project
vim.api.nvim_create_user_command("DjangoStartProject", function(args)
  local cmd = string.format("bel 10split term://django-admin startproject %s", args.args)
  vim.cmd(cmd)
  vim.cmd("startinsert")
end, {nargs="?"});

django_load()

-- Reloading django commands
vim.api.nvim_create_user_command("DjangoLoad", function()
  django_load()
end, {});

return {};
