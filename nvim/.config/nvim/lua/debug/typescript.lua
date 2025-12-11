-- TypeScript-specific DAP configurations
return {
    {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
    },
    {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
        port = 9229,
    },
    {
        name = 'NestJS: debug',
        type = 'pwa-node',
        request = 'launch',
        trace = true,
        cwd = vim.fn.getcwd(),
        runtimeExecutable = 'node',
        program = '${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js',
        args = {
            'start',
            '--debug',
            '--watch',
            '--preserveWatchOutput',
        },
        sourceMaps = true,
        stopOnEntry = false,
        console = 'integratedTerminal',
        protocol = 'auto',
        outDir = '${workspaceFolder}/dist',
        restart = true,
    },
}
