local config = require("deardiary.config")

config.journals = {
    {
        path = "d:\\gitrepo\\deardiary",
        frequencies = {
            daily = {
                template = function(entry_date)
                    -- Changes template string
                    return entry_date:fmt("# %Y-%m-%d\n- 地点：上海\n- 天气：多云\n\n## 评论\n\n## 记录\n\n## 其他\n")
                end,
            },
        },-- "weekly"
    },
    -- {
    --     path = "~/journals/work",
    --     frequencies = {"daily", "weekly", "monthly", "yearly"},
    -- },
}
