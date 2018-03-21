$(function() {
	totl();
	adddel()
	//全选
	$("#all").click(function() {
		all = $(this).prop("checked")
		$(".Each").each(function() {
			$(this).prop("checked", all);
		})
	})
	//删除当前行
	$(".del").each(function() {
		$(this).click(function() {
			$(this).parent().parent().remove();
			if($(".imfor").length == 0) {
				$("#susum").text(0);
			}
			totl();
		})
	})
	//添加一行
	$(".foot_add").click(function() {
		var str = '<div class="imfor">' +
			'<div class="check">' +
			'<input type="checkbox" class="Each" />' +
			'</div>' +
			'<div class="pudc"><img src="img/5.jpg" /><span>Fujifilm/富士 instax mini 25</span></div>' +
			'<div class="pices">640.6</div>' +
			'<div class="num"><span class="reduc">&nbsp;-&nbsp;</span><input type="text" value="1" /><span class="add">&nbsp;+</span></div>' +
			'<div class="totle">640.6</div>' +
			'<div class="del">删除</div>' +
			'</div>';
		$(this).parent().prev().append(str);
		totl();
		adddel()
		$(".del").each(function() {
			$(this).click(function() {
				$(this).parent().remove();
				totl();
			})
		})
	})
	//全选删除										
	$(".foot_del").click(function() {
		$(".Each").each(function() {
			if($(this).prop('checked')) {
				$(this).parents(".imfor").remove();
				totl();
				if($(".imfor").length == 0) {
					$("#susum").text(0);
				}
			}
		})

	})

})
//合计
function totl() {
	var sum = 0;
	$(".totle").each(function() {
		sum += parseFloat($(this).text());
		$("#susum").text(sum);
	})
}

function adddel() {
	//小计和加减
	//加
	$(".add").each(function() {
		$(this).click(function() {
			var $multi = 0;
			var vall = $(this).prev().val();
			vall++;
			$(this).prev().val(vall);
			$multi = parseFloat(vall) * parseFloat($(this).parent().prev().text());
			$(this).parent().next().text(Math.round($multi));
			totl();
		})

	})
	//减
	$(".reduc").each(function() {
		$(this).click(function() {
			var $multi1 = 0;
			var vall1 = $(this).next().val();
			vall1--;
			if(vall1 <= 0) {
				vall1 = 1;
			}
			$(this).next().val(vall1);
			$multi1 = parseFloat(vall1) * parseFloat($(this).parent().prev().text());
			$(this).parent().next().text(Math.round($multi1));
			totl();
		})

	})
}