return {
    formatCommand = string.format(
        "luafmt -l 0 -w replace %s",
        vim.fn.expand("%:p:h")
    )
}
