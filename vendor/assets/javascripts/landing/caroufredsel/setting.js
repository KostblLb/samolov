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
})(jQuery);