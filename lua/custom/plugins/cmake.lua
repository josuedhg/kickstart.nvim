
require("custom.common")

local function cmake_context(callback)
    if not File_exists("build") then
      vim.cmd("!mkdir build")
    end
    vim.cmd("cd build")
    callback()
    vim.cmd("cd ..")
end

local function cmake_run_target(target)
  cmake_context(function()
    local target_arg = ""

    if string.len(target) ~= 0 then
      target_arg = string.format("--target %s", target)
    else
      target_arg = ""
    end

    local cmake_cmd = string.format("bel 10split term://cmake --build . %s", target_arg)
    vim.cmd(cmake_cmd)
    vim.cmd("startinsert")
  end)
end

if File_exists("CMakeLists.txt") then
  vim.api.nvim_create_user_command("CMakeGenerate", function(args)
    cmake_context(function()
      local vim_cmd = string.format("bel 10split term://cmake %s ..", args.args)
      vim.cmd(vim_cmd)
      vim.cmd("startinsert")
    end)
  end, {nargs="?"})

  vim.api.nvim_create_user_command("CMakeBuild", function(args)
    cmake_run_target(args.args)
  end, {nargs="?"})
end

return {};
