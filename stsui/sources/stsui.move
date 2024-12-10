
#[allow(unused_field)]
module stsui::stsui{
    use sui::coin;
    use sui::url;
   


    public struct STSUI has drop {
        dummy_field: bool
    }

    

    
    #[lint_allow(share_owned)]
    fun init(witness: STSUI, ctx: &mut TxContext) {
        let (treasury, meta) = coin::create_currency(
            witness, 9, b"stSUI", b"AlphaFi Staked SUI", b"Instantly unstakable liquid staking token by AlphaFi", option::some(url::new_unsafe_from_bytes(b"https://images.alphafi.xyz/stSUI.png")), ctx
        );
        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury, ctx.sender());
        
    }


    
}
