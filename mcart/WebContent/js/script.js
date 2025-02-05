function addToCart(pId,pName,pPrice) {
	
	let cart=localStorage.getItem("cart");
	if(cart==null)
		{
			let products=[];
			let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			 // console.log("Product is added in first time")
			  showToast("Item is added to cart")
		}
	else
		{
		  let pcart=JSON.parse(cart);
		  let oldProduct=pcart.find((item) => item.productId == pId)
		  if(oldProduct)
			  {
			  oldProduct.productQuantity=oldProduct.productQuantity + 1;
			  pcart.map((item) => {
				  
				 if(item.productId === oldProduct.productId) 
					 {
					 item.productQuantity = oldProduct.productQuantity;
					 }
			  })
			  localStorage.setItem("cart",JSON.stringify(pcart));
			//  console.log("Product quantity increased")
			  showToast(oldProduct.productName + "Product quantity increased")
			  
			  }
		  else
		      {
			  let product={productId:pId,productName:pName,productQuantity:1,productPrice:pPrice}
			  pcart.push(product);
			  localStorage.setItem("cart",JSON.stringify(pcart));
			 // console.log("Product is added")
			  showToast("Item is added to cart")
		      }
		}
	updateCart();
}

function updateCart() {
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart == null || cart.length == 0)
		{
			console.log("Cart is empty !!")
			$(".cart-items").html("( 0 )");
			$(".cart-body").html("<h3>Cart does not have any items</h3>");
			$(".checkout-btn").attr('disabled',true);
		}
	else {
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
			<table class='table'>
			<thead class='thread-light'>
				<tr>
				<th>Item Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Action</th>
				
				
				</tr>
			
			
			</thead>
		`;
		
		let totalPrice=0;
		cart.map((item)=>{
			
			table += `
				<tr>
					<td> ${item.productName} </td>
					<td> ${item.productPrice} </td>
					<td> ${item.productQuantity} </td>
					<td> ${item.productPrice * item.productQuantity} </td>
					<td> <button onclick='deleteItemFormCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>
			    </tr>
			    `
				totalPrice += item.productPrice * item.productQuantity;
				
		})
		
		
		table = table + `<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price : ${totalPrice}</td></tr>
		</table>`
		
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}
	
}

function deleteItemFormCart(pId)
{
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newCart=cart.filter((item)=> item.productId != pId)
	localStorage.setItem('cart',JSON.stringify(newCart));
	updateCart();
	showToast("Item is removed from cart")
}

$(document).ready(function (){
	updateCart()
})

function showToast(content)
{
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
	
}

function goToCheckout() {
	
	window.location="checkout.jsp"
}