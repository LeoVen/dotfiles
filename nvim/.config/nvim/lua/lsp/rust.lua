return {
    settings = {
        ['rust-analyzer'] = {
            -- https://rust-analyzer.github.io/book/configuration.html
            check = {
                command = 'clippy',
                extraArgs = { '--no-deps' },
            },
        },
    },
}
