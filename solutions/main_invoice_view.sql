create view invoices as 

select 
			total_amt, due_amt,  subtotal_amt, 
            invoice_hub.sk_id as invoice_id, 
            invoice_lnk.fk_x_invoice_item_hub_id as invoice_item_id
            
from v_x_invoice_sat as invoice_sat

join v_x_invoice_hub as invoice_hub
on invoice_hub.sk_id = invoice_sat.fk_x_invoice_hub_id

join v_x_invoice_x_invoice_item_lnk as invoice_lnk
on invoice_lnk.fk_x_invoice_hub_id = invoice_hub.sk_id 
