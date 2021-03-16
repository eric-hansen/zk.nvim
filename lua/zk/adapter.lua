-- The interface between our plugin and zk

local M = {}

function M.new(title)
  local cmd = "zk new"

  if title ~= nil and title ~= "" then
    cmd = string.format("zk new --title %s", title)
  end

  vim.fn.jobstart(
    cmd,
    {
      on_stdout = function(j, d, e)
        print(
          string.format("[zk.nvim] on_stdout -> j: %s, d: %s, e: %s", vim.inspect(j), vim.inspect(d), vim.inspect(e))
        )
        if d == 0 then
          vim.api.nvim_out_write("[zk.nvim] new zettel note created")
          return
        end

        vim.api.nvim_err_writeln("[zk.nvim] failed to create new zettel note")
      end,
      on_stderr = function(j, d, e)
        print(
          string.format("[zk.nvim] on_stderr -> j: %s, d: %s, e: %s", vim.inspect(j), vim.inspect(d), vim.inspect(e))
        )
        if d == 0 then
          vim.api.nvim_out_write("[zk.nvim] new zettel note created")
          return
        end

        vim.api.nvim_err_writeln("[zk.nvim] failed to create new zettel note")
      end,
      on_exit = function(j, d, e)
        print(string.format("[zk.nvim] on_exit -> j: %s, d: %s, e: %s", vim.inspect(j), vim.inspect(d), vim.inspect(e)))
        if d == 0 then
          vim.api.nvim_out_write("[zk.nvim] new zettel note created")
          return
        end

        vim.api.nvim_err_writeln("[zk.nvim] failed to create new zettel note")
      end
    }
  )
end

function M.search()
end

function M.backlink()
end

return M
