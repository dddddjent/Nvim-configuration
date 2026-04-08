local M = {}

local snippets = {
    ["mk"] = [[\$]] .. "${1}" .. [[\$]] .. "$0",
    ["dm"] = [[\$\$]] .. "\n\t$0\n" .. [[\$\$]],
    ["beg"] = "\\begin{${1}}\n\t$0\n\\end{${1}}",

    ["@a"] = "\\alpha",
    ["@b"] = "\\beta",
    ["@g"] = "\\gamma",
    ["@G"] = "\\Gamma",
    ["@d"] = "\\delta",
    ["@D"] = "\\Delta",
    ["@e"] = "\\epsilon",
    [":e"] = "\\varepsilon",
    ["@z"] = "\\zeta",
    ["@t"] = "\\theta",
    ["@T"] = "\\Theta",
    [":t"] = "\\vartheta",
    ["@i"] = "\\iota",
    ["@k"] = "\\kappa",
    ["@l"] = "\\lambda",
    ["@L"] = "\\Lambda",
    ["@s"] = "\\sigma",
    ["@S"] = "\\Sigma",
    ["@u"] = "\\upsilon",
    ["@U"] = "\\Upsilon",
    ["@o"] = "\\omega",
    ["@O"] = "\\Omega",
    ["@n"] = "\\nabla",
    ["ome"] = "\\omega",
    ["Ome"] = "\\Omega",
    ["nabl"] = "\\nabla",
    ["del"] = "\\nabla",

    ["text"] = "\\text{${1}}$0",
    ["\""] = "\\text{${1}}$0",

    ["td"] = "^{${1}}$0",
    ["rd"] = "^{${1}}$0",
    ["sr"] = "^{2}",
    ["cb"] = "^{3}",
    ["_"] = "_{${1}}$0",
    ["sts"] = "_\\text{${1}}$0",
    ["sq"] = "\\sqrt{ ${1} }$0",
    ["//"] = "\\frac{${1}}{${2}}$0",
    ["ee"] = "e^{ ${1} }$0",
    ["invs"] = "^{-1}",
    ["compl"] = "^{c}",
    ["conj"] = "^{*}",
    ["Re"] = "\\mathrm{Re}",
    ["Im"] = "\\mathrm{Im}",
    ["bf"] = "\\mathbf{${1}}$0",
    ["rm"] = "\\mathrm{${1}}$0",
    ["det"] = "\\det",
    ["trace"] = "\\mathrm{Tr}",

    ["hat"] = "\\hat{${1}}$0",
    ["bar"] = "\\bar{${1}}$0",
    ["dot"] = "\\dot{${1}}$0",
    ["ddot"] = "\\ddot{${1}}$0",
    ["cdot"] = "\\cdot",
    ["tilde"] = "\\tilde{${1}}$0",
    ["und"] = "\\underline{${1}}$0",
    ["vec"] = "\\vec{${1}}$0",

    ["xnn"] = "x_{n}",
    ["xii"] = "x_{i}",
    ["xjj"] = "x_{j}",
    ["xp1"] = "x_{n+1}",
    ["ynn"] = "y_{n}",
    ["yii"] = "y_{i}",
    ["yjj"] = "y_{j}",

    ["ooo"] = "\\infty",
    ["sum"] = "\\sum",
    ["prod"] = "\\prod",
    ["\\sum"] = "\\sum_{${1:i}=${2:1}}^{${3:N}} ${4}$0",
    ["\\prod"] = "\\prod_{${1:i}=${2:1}}^{${3:N}} ${4}$0",
    ["lim"] = "\\lim_{ ${1:n} \\to \\infty } ${2}$0",
    ["+-"] = "\\pm",
    ["-+"] = "\\mp",
    ["..."] = "\\dots",
    ["xx"] = "\\times",
    ["**"] = "\\cdot",
    ["para"] = "\\parallel",

    ["==="] = "\\equiv",
    ["!="] = "\\neq",
    [">="] = "\\geq",
    ["<="] = "\\leq",
    [">>"] = "\\gg",
    ["<<"] = "\\ll",
    ["simm"] = "\\sim",
    ["sim="] = "\\simeq",
    ["prop"] = "\\propto",

    ["<->"] = "\\leftrightarrow ",
    ["->"] = "\\to",
    ["!>"] = "\\mapsto",
    ["=>"] = "\\implies",
    ["=<"] = "\\impliedby",

    ["and"] = "\\cap",
    ["orr"] = "\\cup",
    ["inn"] = "\\in",
    ["notin"] = "\\not\\in",
    ["\\\\\\"] = "\\setminus",
    ["sub="] = "\\subseteq",
    ["sup="] = "\\supseteq",
    ["eset"] = "\\emptyset",
    ["exists"] = "\\exists",

    ["LL"] = "\\mathcal{L}",
    ["HH"] = "\\mathcal{H}",
    ["CC"] = "\\mathbb{C}",
    ["RR"] = "\\mathbb{R}",
    ["ZZ"] = "\\mathbb{Z}",
    ["NN"] = "\\mathbb{N}",
    ["cal"] = "\\mathcal{${1}}$0",

    ["exp"] = "\\exp",
    ["log"] = "\\log",
    ["ln"] = "\\ln",
    ["sin"] = "\\sin",
    ["arcsin"] = "\\arcsin",
    ["cos"] = "\\cos",
    ["arccos"] = "\\arccos",
    ["tan"] = "\\tan",
    ["arctan"] = "\\arctan",
    ["csc"] = "\\csc",
    ["sec"] = "\\sec",
    ["cot"] = "\\cot",
    ["sinh"] = "\\sinh",
    ["cosh"] = "\\cosh",
    ["tanh"] = "\\tanh",
    ["coth"] = "\\coth",

    ["par"] = "\\frac{ \\partial ${1:y} }{ \\partial ${2:x} } ${3}$0",
    ["ddt"] = "\\frac{d}{dt} ",
    ["int"] = "\\int",
    ["\\int"] = "\\int ${1} \\, d${2:x} ${3}$0",
    ["dint"] = "\\int_{${1:0}}^{${2:1}} ${3} \\, d${4:x} ${5}$0",
    ["oint"] = "\\oint",
    ["iint"] = "\\iint",
    ["iiint"] = "\\iiint",
    ["oinf"] = "\\int_{0}^{\\infty} ${1} \\, d${2:x} ${3}$0",
    ["infi"] = "\\int_{-\\infty}^{\\infty} ${1} \\, d${2:x} ${3}$0",

    ["kbt"] = "k_{B}T",
    ["msun"] = "M_{\\odot}",

    ["dag"] = "^{\\dagger}",
    ["o+"] = "\\oplus ",
    ["ox"] = "\\otimes ",
    ["bra"] = "\\bra{${1}} ${2}$0",
    ["ket"] = "\\ket{${1}} ${2}$0",
    ["brk"] = "\\braket{ ${1} | ${2} } ${3}$0",
    ["outer"] = "\\ket{${1:psi}} \\bra{$1} ${2}$0",

    ["pu"] = "\\pu{ ${1} }$0",
    ["cee"] = "\\ce{ ${1} }$0",
    ["he4"] = "{}^{4}_{2}He ",
    ["he3"] = "{}^{3}_{2}He ",
    ["iso"] = "{}^{${1:4}}_{${2:2}}${3:He}$0",

    ["pmat"] = "\\begin{pmatrix}\n\t$0\n\\end{pmatrix}",
    ["bmat"] = "\\begin{bmatrix}\n\t$0\n\\end{bmatrix}",
    ["Bmat"] = "\\begin{Bmatrix}\n\t$0\n\\end{Bmatrix}",
    ["vmat"] = "\\begin{vmatrix}\n\t$0\n\\end{vmatrix}",
    ["Vmat"] = "\\begin{Vmatrix}\n\t$0\n\\end{Vmatrix}",
    ["matrix"] = "\\begin{matrix}\n\t$0\n\\end{matrix}",
    ["cases"] = "\\begin{cases}\n\t$0\n\\end{cases}",
    ["align"] = "\\begin{align}\n\t$0\n\\end{align}",
    ["array"] = "\\begin{array}{${1}}\n\t$0\n\\end{array}",

    ["avg"] = "\\langle ${1} \\rangle ${2}$0",
    ["norm"] = "\\lvert ${1} \\rvert ${2}$0",
    ["Norm"] = "\\lVert ${1} \\rVert ${2}$0",
    ["ceil"] = "\\lceil ${1} \\rceil ${2}$0",
    ["floor"] = "\\lfloor ${1} \\rfloor ${2}$0",
    ["mod"] = "|${1}|$0",
    ["lr("] = "\\left( ${1} \\right) ${2}$0",
    ["lr{"] = "\\left\\{ ${1} \\right\\} ${2}$0",
    ["lr["] = "\\left[ ${1} \\right] ${2}$0",
    ["lr|"] = "\\left| ${1} \\right| ${2}$0",
    ["lra"] = "\\left< ${1} \\right> ${2}$0",
}

local funcs = {
    {
        pattern = "([^\\])(exp|log|ln)$",
        expand = function(prefix, name)
            return prefix .. "\\" .. name
        end,
    },
    {
        pattern = "([^\\])(arcsin|sin|arccos|cos|arctan|tan|csc|sec|cot)$",
        expand = function(prefix, name)
            return prefix .. "\\" .. name
        end,
    },
    {
        pattern = "([^\\])(sinh|cosh|tanh|coth)$",
        expand = function(prefix, name)
            return prefix .. "\\" .. name
        end,
    },
    {
        pattern = "([^\\])(int)$",
        expand = function(prefix, name)
            return prefix .. "\\" .. name
        end,
    },
    {
        pattern = "([A-Za-z])(%d)$",
        expand = function(x, n)
            return x .. "_" .. n
        end,
    },
    {
        pattern = "([A-Za-z])_(%d%d)$",
        expand = function(x, n)
            return x .. "_{" .. n .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])ddot$",
        expand = function(x)
            return "\\ddot{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])hat$",
        expand = function(x)
            return "\\hat{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])bar$",
        expand = function(x)
            return "\\bar{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])dot$",
        expand = function(x)
            return "\\dot{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])tilde$",
        expand = function(x)
            return "\\tilde{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])und$",
        expand = function(x)
            return "\\underline{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])vec$",
        expand = function(x)
            return "\\vec{" .. x .. "}"
        end,
    },
    {
        pattern = "\\alpha,%.$",
        expand = function()
            return "\\boldsymbol{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha%.,$",
        expand = function()
            return "\\boldsymbol{\\alpha}"
        end,
    },
    {
        pattern = "\\beta,%.$",
        expand = function()
            return "\\boldsymbol{\\beta}"
        end,
    },
    {
        pattern = "\\beta%.,$",
        expand = function()
            return "\\boldsymbol{\\beta}"
        end,
    },
    {
        pattern = "\\gamma,%.$",
        expand = function()
            return "\\boldsymbol{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma%.,$",
        expand = function()
            return "\\boldsymbol{\\gamma}"
        end,
    },
    {
        pattern = "\\Gamma,%.$",
        expand = function()
            return "\\boldsymbol{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma%.,$",
        expand = function()
            return "\\boldsymbol{\\Gamma}"
        end,
    },
    {
        pattern = "\\delta,%.$",
        expand = function()
            return "\\boldsymbol{\\delta}"
        end,
    },
    {
        pattern = "\\delta%.,$",
        expand = function()
            return "\\boldsymbol{\\delta}"
        end,
    },
    {
        pattern = "\\Delta,%.$",
        expand = function()
            return "\\boldsymbol{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta%.,$",
        expand = function()
            return "\\boldsymbol{\\Delta}"
        end,
    },
    {
        pattern = "\\epsilon,%.$",
        expand = function()
            return "\\boldsymbol{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon%.,$",
        expand = function()
            return "\\boldsymbol{\\epsilon}"
        end,
    },
    {
        pattern = "\\varepsilon,%.$",
        expand = function()
            return "\\boldsymbol{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon%.,$",
        expand = function()
            return "\\boldsymbol{\\varepsilon}"
        end,
    },
    {
        pattern = "\\zeta,%.$",
        expand = function()
            return "\\boldsymbol{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta%.,$",
        expand = function()
            return "\\boldsymbol{\\zeta}"
        end,
    },
    {
        pattern = "\\theta,%.$",
        expand = function()
            return "\\boldsymbol{\\theta}"
        end,
    },
    {
        pattern = "\\theta%.,$",
        expand = function()
            return "\\boldsymbol{\\theta}"
        end,
    },
    {
        pattern = "\\Theta,%.$",
        expand = function()
            return "\\boldsymbol{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta%.,$",
        expand = function()
            return "\\boldsymbol{\\Theta}"
        end,
    },
    {
        pattern = "\\vartheta,%.$",
        expand = function()
            return "\\boldsymbol{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta%.,$",
        expand = function()
            return "\\boldsymbol{\\vartheta}"
        end,
    },
    {
        pattern = "\\iota,%.$",
        expand = function()
            return "\\boldsymbol{\\iota}"
        end,
    },
    {
        pattern = "\\iota%.,$",
        expand = function()
            return "\\boldsymbol{\\iota}"
        end,
    },
    {
        pattern = "\\kappa,%.$",
        expand = function()
            return "\\boldsymbol{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa%.,$",
        expand = function()
            return "\\boldsymbol{\\kappa}"
        end,
    },
    {
        pattern = "\\lambda,%.$",
        expand = function()
            return "\\boldsymbol{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda%.,$",
        expand = function()
            return "\\boldsymbol{\\lambda}"
        end,
    },
    {
        pattern = "\\Lambda,%.$",
        expand = function()
            return "\\boldsymbol{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda%.,$",
        expand = function()
            return "\\boldsymbol{\\Lambda}"
        end,
    },
    {
        pattern = "\\sigma,%.$",
        expand = function()
            return "\\boldsymbol{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma%.,$",
        expand = function()
            return "\\boldsymbol{\\sigma}"
        end,
    },
    {
        pattern = "\\Sigma,%.$",
        expand = function()
            return "\\boldsymbol{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma%.,$",
        expand = function()
            return "\\boldsymbol{\\Sigma}"
        end,
    },
    {
        pattern = "\\upsilon,%.$",
        expand = function()
            return "\\boldsymbol{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon%.,$",
        expand = function()
            return "\\boldsymbol{\\upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon,%.$",
        expand = function()
            return "\\boldsymbol{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon%.,$",
        expand = function()
            return "\\boldsymbol{\\Upsilon}"
        end,
    },
    {
        pattern = "\\omega,%.$",
        expand = function()
            return "\\boldsymbol{\\omega}"
        end,
    },
    {
        pattern = "\\omega%.,$",
        expand = function()
            return "\\boldsymbol{\\omega}"
        end,
    },
    {
        pattern = "\\Omega,%.$",
        expand = function()
            return "\\boldsymbol{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega%.,$",
        expand = function()
            return "\\boldsymbol{\\Omega}"
        end,
    },
    {
        pattern = "\\nabla,%.$",
        expand = function()
            return "\\boldsymbol{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla%.,$",
        expand = function()
            return "\\boldsymbol{\\nabla}"
        end,
    },
    {
        pattern = "\\alpha hat$",
        expand = function()
            return "\\hat{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha dot$",
        expand = function()
            return "\\dot{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha bar$",
        expand = function()
            return "\\bar{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha vec$",
        expand = function()
            return "\\vec{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha tilde$",
        expand = function()
            return "\\tilde{\\alpha}"
        end,
    },
    {
        pattern = "\\alpha und$",
        expand = function()
            return "\\underline{\\alpha}"
        end,
    },
    {
        pattern = "\\beta hat$",
        expand = function()
            return "\\hat{\\beta}"
        end,
    },
    {
        pattern = "\\beta dot$",
        expand = function()
            return "\\dot{\\beta}"
        end,
    },
    {
        pattern = "\\beta bar$",
        expand = function()
            return "\\bar{\\beta}"
        end,
    },
    {
        pattern = "\\beta vec$",
        expand = function()
            return "\\vec{\\beta}"
        end,
    },
    {
        pattern = "\\beta tilde$",
        expand = function()
            return "\\tilde{\\beta}"
        end,
    },
    {
        pattern = "\\beta und$",
        expand = function()
            return "\\underline{\\beta}"
        end,
    },
    {
        pattern = "\\gamma hat$",
        expand = function()
            return "\\hat{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma dot$",
        expand = function()
            return "\\dot{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma bar$",
        expand = function()
            return "\\bar{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma vec$",
        expand = function()
            return "\\vec{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma tilde$",
        expand = function()
            return "\\tilde{\\gamma}"
        end,
    },
    {
        pattern = "\\gamma und$",
        expand = function()
            return "\\underline{\\gamma}"
        end,
    },
    {
        pattern = "\\Gamma hat$",
        expand = function()
            return "\\hat{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma dot$",
        expand = function()
            return "\\dot{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma bar$",
        expand = function()
            return "\\bar{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma vec$",
        expand = function()
            return "\\vec{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma tilde$",
        expand = function()
            return "\\tilde{\\Gamma}"
        end,
    },
    {
        pattern = "\\Gamma und$",
        expand = function()
            return "\\underline{\\Gamma}"
        end,
    },
    {
        pattern = "\\delta hat$",
        expand = function()
            return "\\hat{\\delta}"
        end,
    },
    {
        pattern = "\\delta dot$",
        expand = function()
            return "\\dot{\\delta}"
        end,
    },
    {
        pattern = "\\delta bar$",
        expand = function()
            return "\\bar{\\delta}"
        end,
    },
    {
        pattern = "\\delta vec$",
        expand = function()
            return "\\vec{\\delta}"
        end,
    },
    {
        pattern = "\\delta tilde$",
        expand = function()
            return "\\tilde{\\delta}"
        end,
    },
    {
        pattern = "\\delta und$",
        expand = function()
            return "\\underline{\\delta}"
        end,
    },
    {
        pattern = "\\Delta hat$",
        expand = function()
            return "\\hat{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta dot$",
        expand = function()
            return "\\dot{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta bar$",
        expand = function()
            return "\\bar{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta vec$",
        expand = function()
            return "\\vec{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta tilde$",
        expand = function()
            return "\\tilde{\\Delta}"
        end,
    },
    {
        pattern = "\\Delta und$",
        expand = function()
            return "\\underline{\\Delta}"
        end,
    },
    {
        pattern = "\\epsilon hat$",
        expand = function()
            return "\\hat{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon dot$",
        expand = function()
            return "\\dot{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon bar$",
        expand = function()
            return "\\bar{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon vec$",
        expand = function()
            return "\\vec{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon tilde$",
        expand = function()
            return "\\tilde{\\epsilon}"
        end,
    },
    {
        pattern = "\\epsilon und$",
        expand = function()
            return "\\underline{\\epsilon}"
        end,
    },
    {
        pattern = "\\varepsilon hat$",
        expand = function()
            return "\\hat{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon dot$",
        expand = function()
            return "\\dot{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon bar$",
        expand = function()
            return "\\bar{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon vec$",
        expand = function()
            return "\\vec{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon tilde$",
        expand = function()
            return "\\tilde{\\varepsilon}"
        end,
    },
    {
        pattern = "\\varepsilon und$",
        expand = function()
            return "\\underline{\\varepsilon}"
        end,
    },
    {
        pattern = "\\zeta hat$",
        expand = function()
            return "\\hat{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta dot$",
        expand = function()
            return "\\dot{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta bar$",
        expand = function()
            return "\\bar{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta vec$",
        expand = function()
            return "\\vec{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta tilde$",
        expand = function()
            return "\\tilde{\\zeta}"
        end,
    },
    {
        pattern = "\\zeta und$",
        expand = function()
            return "\\underline{\\zeta}"
        end,
    },
    {
        pattern = "\\theta hat$",
        expand = function()
            return "\\hat{\\theta}"
        end,
    },
    {
        pattern = "\\theta dot$",
        expand = function()
            return "\\dot{\\theta}"
        end,
    },
    {
        pattern = "\\theta bar$",
        expand = function()
            return "\\bar{\\theta}"
        end,
    },
    {
        pattern = "\\theta vec$",
        expand = function()
            return "\\vec{\\theta}"
        end,
    },
    {
        pattern = "\\theta tilde$",
        expand = function()
            return "\\tilde{\\theta}"
        end,
    },
    {
        pattern = "\\theta und$",
        expand = function()
            return "\\underline{\\theta}"
        end,
    },
    {
        pattern = "\\Theta hat$",
        expand = function()
            return "\\hat{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta dot$",
        expand = function()
            return "\\dot{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta bar$",
        expand = function()
            return "\\bar{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta vec$",
        expand = function()
            return "\\vec{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta tilde$",
        expand = function()
            return "\\tilde{\\Theta}"
        end,
    },
    {
        pattern = "\\Theta und$",
        expand = function()
            return "\\underline{\\Theta}"
        end,
    },
    {
        pattern = "\\vartheta hat$",
        expand = function()
            return "\\hat{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta dot$",
        expand = function()
            return "\\dot{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta bar$",
        expand = function()
            return "\\bar{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta vec$",
        expand = function()
            return "\\vec{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta tilde$",
        expand = function()
            return "\\tilde{\\vartheta}"
        end,
    },
    {
        pattern = "\\vartheta und$",
        expand = function()
            return "\\underline{\\vartheta}"
        end,
    },
    {
        pattern = "\\iota hat$",
        expand = function()
            return "\\hat{\\iota}"
        end,
    },
    {
        pattern = "\\iota dot$",
        expand = function()
            return "\\dot{\\iota}"
        end,
    },
    {
        pattern = "\\iota bar$",
        expand = function()
            return "\\bar{\\iota}"
        end,
    },
    {
        pattern = "\\iota vec$",
        expand = function()
            return "\\vec{\\iota}"
        end,
    },
    {
        pattern = "\\iota tilde$",
        expand = function()
            return "\\tilde{\\iota}"
        end,
    },
    {
        pattern = "\\iota und$",
        expand = function()
            return "\\underline{\\iota}"
        end,
    },
    {
        pattern = "\\kappa hat$",
        expand = function()
            return "\\hat{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa dot$",
        expand = function()
            return "\\dot{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa bar$",
        expand = function()
            return "\\bar{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa vec$",
        expand = function()
            return "\\vec{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa tilde$",
        expand = function()
            return "\\tilde{\\kappa}"
        end,
    },
    {
        pattern = "\\kappa und$",
        expand = function()
            return "\\underline{\\kappa}"
        end,
    },
    {
        pattern = "\\lambda hat$",
        expand = function()
            return "\\hat{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda dot$",
        expand = function()
            return "\\dot{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda bar$",
        expand = function()
            return "\\bar{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda vec$",
        expand = function()
            return "\\vec{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda tilde$",
        expand = function()
            return "\\tilde{\\lambda}"
        end,
    },
    {
        pattern = "\\lambda und$",
        expand = function()
            return "\\underline{\\lambda}"
        end,
    },
    {
        pattern = "\\Lambda hat$",
        expand = function()
            return "\\hat{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda dot$",
        expand = function()
            return "\\dot{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda bar$",
        expand = function()
            return "\\bar{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda vec$",
        expand = function()
            return "\\vec{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda tilde$",
        expand = function()
            return "\\tilde{\\Lambda}"
        end,
    },
    {
        pattern = "\\Lambda und$",
        expand = function()
            return "\\underline{\\Lambda}"
        end,
    },
    {
        pattern = "\\sigma hat$",
        expand = function()
            return "\\hat{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma dot$",
        expand = function()
            return "\\dot{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma bar$",
        expand = function()
            return "\\bar{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma vec$",
        expand = function()
            return "\\vec{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma tilde$",
        expand = function()
            return "\\tilde{\\sigma}"
        end,
    },
    {
        pattern = "\\sigma und$",
        expand = function()
            return "\\underline{\\sigma}"
        end,
    },
    {
        pattern = "\\Sigma hat$",
        expand = function()
            return "\\hat{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma dot$",
        expand = function()
            return "\\dot{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma bar$",
        expand = function()
            return "\\bar{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma vec$",
        expand = function()
            return "\\vec{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma tilde$",
        expand = function()
            return "\\tilde{\\Sigma}"
        end,
    },
    {
        pattern = "\\Sigma und$",
        expand = function()
            return "\\underline{\\Sigma}"
        end,
    },
    {
        pattern = "\\upsilon hat$",
        expand = function()
            return "\\hat{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon dot$",
        expand = function()
            return "\\dot{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon bar$",
        expand = function()
            return "\\bar{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon vec$",
        expand = function()
            return "\\vec{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon tilde$",
        expand = function()
            return "\\tilde{\\upsilon}"
        end,
    },
    {
        pattern = "\\upsilon und$",
        expand = function()
            return "\\underline{\\upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon hat$",
        expand = function()
            return "\\hat{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon dot$",
        expand = function()
            return "\\dot{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon bar$",
        expand = function()
            return "\\bar{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon vec$",
        expand = function()
            return "\\vec{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon tilde$",
        expand = function()
            return "\\tilde{\\Upsilon}"
        end,
    },
    {
        pattern = "\\Upsilon und$",
        expand = function()
            return "\\underline{\\Upsilon}"
        end,
    },
    {
        pattern = "\\omega hat$",
        expand = function()
            return "\\hat{\\omega}"
        end,
    },
    {
        pattern = "\\omega dot$",
        expand = function()
            return "\\dot{\\omega}"
        end,
    },
    {
        pattern = "\\omega bar$",
        expand = function()
            return "\\bar{\\omega}"
        end,
    },
    {
        pattern = "\\omega vec$",
        expand = function()
            return "\\vec{\\omega}"
        end,
    },
    {
        pattern = "\\omega tilde$",
        expand = function()
            return "\\tilde{\\omega}"
        end,
    },
    {
        pattern = "\\omega und$",
        expand = function()
            return "\\underline{\\omega}"
        end,
    },
    {
        pattern = "\\Omega hat$",
        expand = function()
            return "\\hat{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega dot$",
        expand = function()
            return "\\dot{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega bar$",
        expand = function()
            return "\\bar{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega vec$",
        expand = function()
            return "\\vec{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega tilde$",
        expand = function()
            return "\\tilde{\\Omega}"
        end,
    },
    {
        pattern = "\\Omega und$",
        expand = function()
            return "\\underline{\\Omega}"
        end,
    },
    {
        pattern = "\\nabla hat$",
        expand = function()
            return "\\hat{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla dot$",
        expand = function()
            return "\\dot{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla bar$",
        expand = function()
            return "\\bar{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla vec$",
        expand = function()
            return "\\vec{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla tilde$",
        expand = function()
            return "\\tilde{\\nabla}"
        end,
    },
    {
        pattern = "\\nabla und$",
        expand = function()
            return "\\underline{\\nabla}"
        end,
    },
    {
        pattern = "([A-Za-z]),%.$",
        expand = function(x)
            return "\\mathbf{" .. x .. "}"
        end,
    },
    {
        pattern = "([A-Za-z])%.,$",
        expand = function(x)
            return "\\mathbf{" .. x .. "}"
        end,
    },
    {
        pattern = "\\hat{([A-Za-z])}(%d)$",
        expand = function(x, n)
            return "\\hat{" .. x .. "}_{" .. n .. "}"
        end,
    },
    {
        pattern = "\\vec{([A-Za-z])}(%d)$",
        expand = function(x, n)
            return "\\vec{" .. x .. "}_{" .. n .. "}"
        end,
    },
    {
        pattern = "\\mathbf{([A-Za-z])}(%d)$",
        expand = function(x, n)
            return "\\mathbf{" .. x .. "}_{" .. n .. "}"
        end,
    },
    {
        pattern = "(%b())/$",
        expand = function(x)
            return "\\frac{" .. x:sub(2, -2) .. "}{${1}}$0"
        end,
    },
    {
        pattern = "([%a%d\\_^{}]+)/$",
        expand = function(x)
            return "\\frac{" .. x .. "}{${1}}$0"
        end,
    },
    {
        pattern = "pa([A-Za-z])([A-Za-z])$",
        expand = function(y, x)
            return "\\frac{ \\partial " .. y .. " }{ \\partial " .. x .. " } "
        end,
    },
    {
        pattern = "\\alpha([A-Za-z])$",
        expand = function(x)
            return "\\alpha " .. x
        end,
    },
    {
        pattern = "\\beta([A-Za-z])$",
        expand = function(x)
            return "\\beta " .. x
        end,
    },
    {
        pattern = "\\gamma([A-Za-z])$",
        expand = function(x)
            return "\\gamma " .. x
        end,
    },
    {
        pattern = "\\Gamma([A-Za-z])$",
        expand = function(x)
            return "\\Gamma " .. x
        end,
    },
    {
        pattern = "\\delta([A-Za-z])$",
        expand = function(x)
            return "\\delta " .. x
        end,
    },
    {
        pattern = "\\Delta([A-Za-z])$",
        expand = function(x)
            return "\\Delta " .. x
        end,
    },
    {
        pattern = "\\epsilon([A-Za-z])$",
        expand = function(x)
            return "\\epsilon " .. x
        end,
    },
    {
        pattern = "\\varepsilon([A-Za-z])$",
        expand = function(x)
            return "\\varepsilon " .. x
        end,
    },
    {
        pattern = "\\zeta([A-Za-z])$",
        expand = function(x)
            return "\\zeta " .. x
        end,
    },
    {
        pattern = "\\theta([A-Za-z])$",
        expand = function(x)
            return "\\theta " .. x
        end,
    },
    {
        pattern = "\\Theta([A-Za-z])$",
        expand = function(x)
            return "\\Theta " .. x
        end,
    },
    {
        pattern = "\\vartheta([A-Za-z])$",
        expand = function(x)
            return "\\vartheta " .. x
        end,
    },
    {
        pattern = "\\iota([A-Za-z])$",
        expand = function(x)
            return "\\iota " .. x
        end,
    },
    {
        pattern = "\\kappa([A-Za-z])$",
        expand = function(x)
            return "\\kappa " .. x
        end,
    },
    {
        pattern = "\\lambda([A-Za-z])$",
        expand = function(x)
            return "\\lambda " .. x
        end,
    },
    {
        pattern = "\\Lambda([A-Za-z])$",
        expand = function(x)
            return "\\Lambda " .. x
        end,
    },
    {
        pattern = "\\sigma([A-Za-z])$",
        expand = function(x)
            return "\\sigma " .. x
        end,
    },
    {
        pattern = "\\Sigma([A-Za-z])$",
        expand = function(x)
            return "\\Sigma " .. x
        end,
    },
    {
        pattern = "\\upsilon([A-Za-z])$",
        expand = function(x)
            return "\\upsilon " .. x
        end,
    },
    {
        pattern = "\\Upsilon([A-Za-z])$",
        expand = function(x)
            return "\\Upsilon " .. x
        end,
    },
    {
        pattern = "\\omega([A-Za-z])$",
        expand = function(x)
            return "\\omega " .. x
        end,
    },
    {
        pattern = "\\Omega([A-Za-z])$",
        expand = function(x)
            return "\\Omega " .. x
        end,
    },
    {
        pattern = "\\nabla([A-Za-z])$",
        expand = function(x)
            return "\\nabla " .. x
        end,
    },
}

for _, greek in ipairs({
    "alpha",
    "beta",
    "gamma",
    "Gamma",
    "delta",
    "Delta",
    "epsilon",
    "varepsilon",
    "zeta",
    "theta",
    "Theta",
    "vartheta",
    "iota",
    "kappa",
    "lambda",
    "Lambda",
    "sigma",
    "Sigma",
    "upsilon",
    "Upsilon",
    "omega",
    "Omega",
    "nabla",
}) do
    table.insert(funcs, {
        pattern = "\\" .. greek .. " sr$",
        expand = function()
            return "\\" .. greek .. "^{2}"
        end,
    })

    table.insert(funcs, {
        pattern = "\\" .. greek .. " cb$",
        expand = function()
            return "\\" .. greek .. "^{3}"
        end,
    })

    table.insert(funcs, {
        pattern = "\\" .. greek .. " rd$",
        expand = function()
            return "\\" .. greek .. "^{${1}}$0"
        end,
    })
end

for _, trig in ipairs({
    "arcsin",
    "sin",
    "arccos",
    "cos",
    "arctan",
    "tan",
    "csc",
    "sec",
    "cot",
}) do
    table.insert(funcs, {
        pattern = "\\" .. trig .. "([A-GI-Za-gi-z])$",
        expand = function(x)
            return "\\" .. trig .. " " .. x
        end,
    })
end

for _, trig in ipairs({
    "arcsin",
    "sin",
    "arccos",
    "cos",
    "arctan",
    "tan",
    "csc",
    "sec",
    "cot",
}) do
    table.insert(funcs, 1, {
        pattern = "\\" .. trig .. "(%d)$",
        expand = function(x)
            return "\\" .. trig .. " " .. x
        end,
    })
end

for _, trig in ipairs({
    "sinh",
    "cosh",
    "tanh",
    "coth",
}) do
    table.insert(funcs, 1, {
        pattern = "\\" .. trig .. "(%d)$",
        expand = function(x)
            return "\\" .. trig .. " " .. x
        end,
    })
end

for _, trig in ipairs({
    "sinh",
    "cosh",
    "tanh",
    "coth",
}) do
    table.insert(funcs, {
        pattern = "\\" .. trig .. "([A-Za-z])$",
        expand = function(x)
            return "\\" .. trig .. " " .. x
        end,
    })
end

local valid_fts = {
    tex = true,
    plaintex = true,
    markdown = true,
}

local triggers = {}
for trigger in pairs(snippets) do
    table.insert(triggers, trigger)
end
table.sort(triggers, function(a, b)
    return #a > #b
end)

local busy = false
local enabled = true
local skip_next_expand = false
local typed_insert_pending = false
local always_allowed_snippets = {
    mk = true,
    dm = true,
    beg = true,
}

local function with_blink_suppressed(fn)
    local bufnr = vim.api.nvim_get_current_buf()
    local previous_completion = vim.b.completion

    local has_blink, blink = pcall(require, "blink.cmp")
    if has_blink then
        pcall(blink.hide)
        pcall(blink.hide_signature)
    end

    vim.b.completion = false
    if vim.snippet.active() then
        pcall(vim.snippet.stop)
    end
    local ok, err = pcall(fn)

    vim.schedule(function()
        if vim.api.nvim_buf_is_valid(bufnr) then
            vim.b[bufnr].completion = previous_completion
        end

        if has_blink then
            pcall(blink.hide)
            pcall(blink.hide_signature)
        end
    end)

    if not ok then
        error(err)
    end
end

local function in_expansion_context()
    if vim.bo.filetype == "markdown" then
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local lines = vim.api.nvim_buf_get_lines(0, 0, row, false)
        local in_display_math = false

        for i, line in ipairs(lines) do
            local text = i == row and line:sub(1, col) or line
            if text:match("^%s*%$%$%s*$") then
                in_display_math = not in_display_math
            end
        end

        if in_display_math then
            return true
        end

        local before = lines[#lines] or ""
        before = before:gsub("%$%$", "")

        local opens = 0
        local idx = 1
        while idx <= #before do
            local char = before:sub(idx, idx)
            if char == "\\" then
                idx = idx + 2
            else
                if char == "$" then
                    opens = opens + 1
                end
                idx = idx + 1
            end
        end

        return opens % 2 == 1
    end

    if vim.bo.filetype ~= "tex" and vim.bo.filetype ~= "plaintex" then
        return true
    end

    local ok, in_mathzone = pcall(vim.fn["vimtex#syntax#in_mathzone"])
    return ok and in_mathzone == 1
end

local function snippet_allowed_anywhere(trigger)
    return always_allowed_snippets[trigger] or trigger:sub(1, 1) == "@"
end

local function skip_expand_once(keys)
    skip_next_expand = true
    typed_insert_pending = false
    return vim.api.nvim_replace_termcodes(keys, true, false, true)
end

local function try_expand()
    if busy then
        return
    end

    if skip_next_expand then
        skip_next_expand = false
        return
    end

    if not typed_insert_pending then
        return
    end
    typed_insert_pending = false

    if not enabled then
        return
    end

    if not valid_fts[vim.bo.filetype] then
        return
    end

    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = pos[1], pos[2]
    local line = vim.api.nvim_get_current_line()
    local before = line:sub(1, col)
    local in_context = in_expansion_context()

    for _, f in ipairs(funcs) do
        local s, _, a, b = before:find(f.pattern)
        if s and in_context then
            busy = true
            vim.api.nvim_buf_set_text(0, row - 1, s - 1, row - 1, col, { "" })
            vim.api.nvim_win_set_cursor(0, { row, s - 1 })
            with_blink_suppressed(function()
                vim.snippet.expand(f.expand(a, b))
            end)
            busy = false
            return
        end
    end

    for _, trig in ipairs(triggers) do
        if before:sub(- #trig) == trig and (in_context or snippet_allowed_anywhere(trig)) then
            busy = true
            local start_col = col - #trig
            vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, col, { "" })
            vim.api.nvim_win_set_cursor(0, { row, start_col })
            with_blink_suppressed(function()
                vim.snippet.expand(snippets[trig])
            end)
            busy = false
            return
        end
    end
end

vim.api.nvim_create_autocmd("TextChangedI", {
    callback = try_expand,
})
vim.api.nvim_create_autocmd("InsertCharPre", {
    callback = function()
        typed_insert_pending = true
    end,
})

function M.enable()
    enabled = true
end

function M.disable()
    enabled = false
end

function M.toggle()
    enabled = not enabled
    return enabled
end

function M.is_enabled()
    return enabled
end

vim.keymap.set("i", "<BS>", function()
    return skip_expand_once("<BS>")
end, { expr = true, silent = true })
vim.keymap.set("i", "<Del>", function()
    return skip_expand_once("<Del>")
end, { expr = true, silent = true })
vim.keymap.set("s", "<BS>", function()
    return skip_expand_once("<C-G>c")
end, { expr = true, silent = true })
vim.keymap.set("s", "<Del>", function()
    return skip_expand_once("<C-G>c")
end, { expr = true, silent = true })
local wk = require("which-key")
wk.add({
    "<leader>vt",
    function()
        M.toggle()
    end,
    desc = "Toggle LaTeX keymaps"
})

return M
