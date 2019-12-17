document.addEventListener('turbolinks:load', () => {
    let controls = document.querySelectorAll('.form-inline-link');

    if (controls.length) {
        controls.forEach((control) => {
            control.addEventListener('click', form_inline_link_handler)
        });
    }

    let errors = document.querySelector('.resource-errors');

    if (errors && controls.length){
        let resource_id = errors.dataset.resourceId;

        form_inline_handler(resource_id)
    }
});

function form_inline_link_handler(e) {
    e.preventDefault();

    let test_id = this.dataset.testId;
    form_inline_handler(test_id);
}

let form_inline_handler = (test_id) => {
    let link = document.querySelector('.form-inline-link[data-test-id="' + test_id + '"]');
    let test_title = document.querySelector('.test-title[data-test-id="' + test_id + '"]');
    let form_inline = document.querySelector('.form-inline[data-test-id="' + test_id + '"]');

    if (form_inline.classList.contains('hide')){
        test_title.classList.add('hide');
        form_inline.classList.remove('hide');
        link.value = 'Cancel';
    }else{
        test_title.classList.remove('hide');
        form_inline.classList.add('hide');
        link.value = 'Edit';
    }
};




