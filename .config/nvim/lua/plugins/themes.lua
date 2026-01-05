return {
    {
        "folke/tokyonight.nvim",
        -- ใส่ priority และ lazy = false เพื่อให้โหลดเร็วและเสร็จก่อน plugin อื่นๆ
        lazy = false, 
        priority = 1000, 
        config = function()
            -- 1. ตั้งค่า colorscheme หลัก
            vim.cmd.colorschema = "tokyonight"
            vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
            
            -- 2. *สำคัญ* เรียก Lualine ให้ตั้งค่าใหม่ (Re-setup) 
            --    เพื่อให้มั่นใจว่าดึงค่า theme "tokyonight" ที่โหลดแล้วมาใช้
            local lualine = require("lualine")
            if lualine then
                lualine.setup({ theme = "tokyonight" })
            end
        end
    },  
    {
        "nvim-lualine/lualine.nvim",
        -- ตรวจสอบให้แน่ใจว่า dependencies ถูกต้อง
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/tokyonight.nvim", -- เพิ่มอันนี้ (ถ้ายังไม่ได้เพิ่ม)
        },
        -- *ลบ* การตั้งค่า theme ออกจาก opts 
        -- เพราะเราจะไปกำหนดใน config ของ tokyonight แทน (ในขั้นตอนที่ 2 ด้านบน)
        -- opts = {
        --     theme = "tokyonight" 
        -- }
    }
}
