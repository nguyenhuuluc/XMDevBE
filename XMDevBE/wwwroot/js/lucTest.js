let carts = [];
let dataCartStr = localStorage.getItem("cart");
if(dataCartStr){
    carts = JSON.parse(dataCartStr);
}
$(function(){
    // # Lấy đối tượng có id = Cart-box trong jQuery
    $("#Cart-box").hide();
    $("#turnon").click(function(){
        $("#Cart-box").show();
    });
});

$(document).on('click', '.miniCart-closeBtn', function(){
    $('.miniCart').hide();
});

$(document).on('click', '.them2', function(){
    let img=$(this).parent().siblings(".image").children('img').attr("src");
    let price=$(this).siblings(".p_price2").text();
    let name=$(this).siblings("h4").text();
    let sl = 1;
    let total = parseFloat(sl) * price;
    let products = new Array(img, price, name, sl, total);

    $('.miniCart').show();

    let nameCheck=$(this).siblings("h4").text();

    let check = false;
    for(let i = 0; i < carts.length; i++) {
        if(carts[i][2] == nameCheck) {
            carts[i][3]++;
            check = true;
            alert("sản phẩm này đã có rồi");
            break;
        }
    }
    if(!check)
    {   
        let prod = {};
        for(let i = 0; i < carts.length; i++){
            if(carts[i][2] == nameCheck){
                prod = carts[i];
                carts[i][3] = 1;
                break; 
            }
        }
        carts.push(products);
    }
    displayCart();
});

function displayCart(){
    let cartStr = JSON.stringify(carts);
    localStorage.setItem("carts", cartStr); 

    let viewCart = ''; 
    for(let i = 0; i < carts.length; i++) {
        let row =`<div class="miniCart-item">
                        <div class="cartItem-img">
                            <img src="${carts[i][0]}" alt="">
                            <button class="rm">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>
                        <div class="cartItem-box">
                            <div class="cartItem-boxInfo">
                                <h3 class="cartItem-infoName">${carts[i][2]}</h3>
                                <div class="cartItem-infoPrice">
                                    <p class="cartItem-newPrice" data-value="1000">${carts[i][1]} ₫</p>
                                    <p class="cartItem-newPrice2" data-value="${carts[i][1]} ">${carts[i][1]} ₫</p>
                                    <div class="soluong">
                                        <input type="number" name="soLuong" class="soLuong" value="${carts[i][3]}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>`

            viewCart += row;
    }

    $('.miniCart-body').html(viewCart);

    let totalPrice = 0;
    // tinh tong tien
    for(let i = 0; i < carts.length; i++) {
        totalPrice += (carts[i][1] * carts[i][3])
    }
    console.log(totalPrice);

    //document.getElementById('quantity').innerText = carts.length;
    $('.miniCart-price').text(totalPrice + "đ")

}

$(document).on("change",'.soluong input[type="number"]', function(){
    let sl = $(this).val();
    let gia= $(this).parent().siblings(".cartItem-newPrice2").attr("data-value");
    let tt = parseInt(sl)*parseInt(gia);
    $(this).parent().siblings(".cartItem-newPrice").attr("data-value",tt);
    let tong=0;
        $('.cartItem-newPrice').each(function(){
            let t = $(this).attr("data-value");
            tong += parseFloat(t);
        });
        $(this).parent().parent().parent().parent().parent().parent().siblings(".miniCart-footer").children(".miniCart-total").children('span.miniCart-price').text(tong+" đ");
});

// Delete
$(document).on('click', '.rm', function(){
    let name = $(this).parent().siblings('.cartItem-box').children('.cartItem-boxInfo').children("h3").text();  
    let index = -1;
    for(let i = 0; i < carts.length; i++) {
        if(name == carts[i][2]) {
            index = i;
            break;
        }
    }

    let leftArr =  carts.slice(0, index)
    let rightArr = carts.slice(index+1)
    carts = leftArr.concat(rightArr);

    displayCart();
});


$(document).on('click', '.navh2' , function(){
    $('.navh2 .button2 .span:nth-child(2)').addClass('spanDeg'); 
    $('.navh2 .button2 .span:nth-child(3)').addClass('spanDeg2'); 
    $('.navh2 .button2 .span:nth-child(1)').addClass('spanNone'); 
    $('.navh2 .button2 .span:nth-child(4)').addClass('spanNone'); 
    $('.navh').addClass('col-12');  
    $('.navh2').addClass('navh2true');  
    $('.navs').addClass('nav_1');  
    $('nav').addClass('navf');  
    $(this).siblings(".logo").hide();
}); 
$(document).on('click', '.navh2.navh2true' , function(){
    $('.navh2 .button2 .span:nth-child(2)').removeClass('spanDeg'); 
    $('.navh2 .button2 .span:nth-child(3)').removeClass('spanDeg2'); 
    $('.navh2 .button2 .span:nth-child(1)').removeClass('spanNone'); 
    $('.navh2 .button2 .span:nth-child(4)').removeClass('spanNone'); 
    $('.navh').removeClass('col-12');  
    $('.navs').removeClass('nav_1');  
    $('.navh2').removeClass ('navh2true'); 
    $('nav').removeClass('navf');  
    $(this).siblings(".logo").show();
}); 
$(window).resize(function () { 
    let header = $('header').height();
    $('.navh2 .button2 .span:nth-child(2)').removeClass('spanDeg'); 
    $('.navh2 .button2 .span:nth-child(3)').removeClass('spanDeg2'); 
    $('.navh2 .button2 .span:nth-child(1)').removeClass('spanNone'); 
    $('.navh2 .button2 .span:nth-child(4)').removeClass ('spanNone'); 
        $('.navh').removeClass('col-12'); 
        $('.navs').removeClass('nav_1');
        $(this).removeClass('active'); 
        $('nav').removeClass('navf'); 
    $(".logo").show(); 
});