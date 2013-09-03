(function(win, jq, undefined) {

	/**
	 * [fileUploader description]
	 * @param  {[type]} options
	 * @return {[type]}
	 */
	jq.fileUploader = function(options) {

		var options = $.extend({
			multiple: false,
			url: '',
			CSRF_token: $('meta[name="csrf-token"]').attr('content'),
			progress: function() {},
			error: function() {},
			success: function() {}
		}, options);

		this.uploadInput = $("<input id='upload' />");
		this.uploadInput.attr('type', 'file');
		//this.uploadInput.css('display', 'none');

		if (options.multiple)
			this.uploadInput.attr('multiple', '');

		this.uploadInput.on('change', function() {
			try {

				/** HTML5 feture */
				var formData = new FormData();

				$.each(this.files, function(i, file) {
					//files[:file1]
					formData.append('files[file'+ i + ']', file);
				});

				/** XMLHttpRequest 2.0 */
				var xhr = new XMLHttpRequest();

				xhr.open('POST', options.url);
				xhr.onload = function() {
					options.success(this);
				};

				xhr.upload.onprogress = function(event) {
					if (event.lengthComputable) {
						options.progress((event.loaded / event.total * 100 | 0));
					}
				};
				//rails support
				xhr.setRequestHeader('X-CSRF-Token', options.CSRF_token);

				xhr.send(formData);

			} catch (err) {
				options.error(err);
			};
		});

		this.uploadInput.click();

		return this;
	};

})(window, jQuery);