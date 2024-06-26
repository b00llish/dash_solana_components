
module DashSolanaComponents
using Dash

const resources_path = realpath(joinpath( @__DIR__, "..", "deps"))
const version = "1.1.1"

include("jl/dsc_solanawalletmultibutton.jl")
include("jl/dsc_transactionbuttonwrapper.jl")
include("jl/dsc_walletcontextprovider.jl")

function __init__()
    DashBase.register_package(
        DashBase.ResourcePkg(
            "dash_solana_components",
            resources_path,
            version = version,
            [
                DashBase.Resource(
    relative_package_path = "dash_solana_components.js",
    external_url = "https://unpkg.com/dash_solana_components@1.1.1/dash_solana_components/dash_solana_components.js",
    dynamic = nothing,
    async = nothing,
    type = :js
),
DashBase.Resource(
    relative_package_path = "dash_solana_components.js.map",
    external_url = "https://unpkg.com/dash_solana_components@1.1.1/dash_solana_components/dash_solana_components.js.map",
    dynamic = true,
    async = nothing,
    type = :js
)
            ]
        )

    )
end
end
