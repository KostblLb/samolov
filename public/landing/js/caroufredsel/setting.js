(function($) {
	'use strict';	
			$('#foo4').carouFredSel({
					prev: '#prev4',
					next: '#next4',
					auto: true,
					responsive: true,
					width: '100%',
					height: 269,
					scroll: 4,
					items: {
						width: 300,
						visible: {
							min: 2,
							max: 8
						}
					}
				});
			$('#foo3').carouFredSel({
				prev: '#prev3',
				next: '#next3',
				auto: false,
				responsive: true,
				width: '100%',
				height: 500,
				scroll: 3,
				items: {
					width: '30%',
					visible: {
						min: 3,
						max: 6
					}
				}
	});
})(jQuery);