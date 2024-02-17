var arr=[];

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
    let price=$(this).siblings(".p_price").text();
    let price2=$(this).siblings(".p_price2").text();
    let name=$(this).siblings("h4").text();
    let html2s=`<div class="miniCart-item">
    <div class="cartItem-img">
        <img src="${img}" alt="">
        <button class="rm">
            <i class="fa-solid fa-xmark"></i>
        </button>
    </div>
    <div class="cartItem-box">
        <div class="cartItem-boxInfo">
            <h3 class="cartItem-infoName">${name   }</h3>
            <div class="cartItem-infoPrice">
            <p class="cartItem-newPrice" data-value="0">${price} ₫</p>
            <p class="cartItem-newPrice2" data-value="${price2}">${price2} ₫</p>
                <div class="soluong">
                    <p class="cartItem-oldPrice"> ${"số lượng"}</p>
                    <input type="number" name="soLuong" class="soLuong" value="0">
                </div>
            </div>
        </div>
    </div>
    </div>`
        let check2=true;
        for(let x=0;x<arr.length;x++){
            if(img==arr[x]){
                check2=false;
            }
        }
        if(check2==true){
            $(".miniCart-body").append(html2s);
            arr.push(img);
        }
        else{
            alert("sản phẩm này đã có rồi");
        }
    $('.miniCart').show();
});
$(document).on("change",'.soluong input[type="number"]', function(){
    let sl = $(this).val();
    let gia=$(this).parent().siblings(".cartItem-newPrice2").attr("data-value");
    let tt = parseInt(sl)*parseInt(gia);
    $(this).parent().siblings(".cartItem-newPrice").attr("data-value",tt);
    let tong=0;
        $('.cartItem-newPrice').each(function(){
            let t = $(this).attr("data-value");
            tong += parseFloat(t);
        });
        $(this).parent().parent().parent().parent().parent().parent().siblings(".miniCart-footer").children(".miniCart-total").children('span.miniCart-price').text(tong+"đ");
});
$(document).on('click', '.rm', function(){
    let removeItem=$(this).parent().parent();
    removeItem.remove();
    let img=$(this).siblings("img").attr("src");
    arr.pop(img);
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