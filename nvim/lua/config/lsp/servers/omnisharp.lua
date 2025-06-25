local omnisharp = {}

omnisharp.setup = function(opts)
  local pid = vim.fn.getpid()
  -- Try to find omnisharp in PATH, fallback to default name
  local omnisharp_bin = vim.fn.exepath('omnisharp')
  if omnisharp_bin == '' then
    omnisharp_bin = 'omnisharp'
  end

  opts.cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) }
end

return omnisharp
