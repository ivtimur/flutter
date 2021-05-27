# tel_number_mask

Flutter project just show how work with mask on TextFormField widget.

This example include mask telephone number like: +0 (000) 000 00 00

You can change the mask format as you like

>  <p>Example: "+_ (___) ___ __ __"</p>
>  <p>Example: "+__-(___)-___-__-__"</p>
>  <p>Example: "+__:___-___-____"</p>
>  <p>Example: "+__:___-___-____"</p>
>  <p>Example: "COD_ (___) ___ __ __"</p>
> or something else
>  <p>Example: "__:__:____" Result: 23:45:1234</p>
> etc

In the mask, specify the "_" character in the place where the number should be

## For use ##
<p>
1. call CheckMask.checkTel(val, mask: mask)</br>
2. Default mask = '+_ (___) ___ __ __'</br>
3. also you can call this metod in StateFullWidget</br>
</p>