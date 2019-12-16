document.addEventListener('turbolinks:load', () => {
    let register_form = document.querySelector('.registration_form');

    if (register_form) { inputs_checker(register_form) }
});

let inputs_checker = (register_form) => {
    let email_input            = register_form.querySelector('.email > input');
    let name_input             = register_form.querySelector('.name > input');
    let surname_input          = register_form.querySelector('.surname > input');
    let password_input         = register_form.querySelector('.password > input');
    let password_confirm_input = register_form.querySelector('.password_confirm > input');

    [
        email_input,
        name_input,
        surname_input,
        password_input
    ].forEach((input) => {
            input.addEventListener('input', () => presence_checker(input));
    });

    password_confirm_input.addEventListener('input', () =>
        equality_checker(password_confirm_input, password_input)
    );
};

let presence_checker = (input) => {
    let error_flag = input.parentNode.querySelector('.octicon-x');
    let success_flag = input.parentNode.querySelector('.octicon-check');

    if (input.value === ''){
        success_flag.classList.add('hide');
        error_flag.classList.remove('hide');
    }else{
        error_flag.classList.add('hide');
        success_flag.classList.remove('hide');
    }
};

let equality_checker = (confirm_input, target_input) => {
    let error_flag = confirm_input.parentNode.querySelector('.octicon-x');
    let success_flag = confirm_input.parentNode.querySelector('.octicon-check');

    if (confirm_input.value !== target_input.value){
        success_flag.classList.add('hide');
        error_flag.classList.remove('hide');
    }else{
        error_flag.classList.add('hide');
        success_flag.classList.remove('hide');
    }

    if (confirm_input.value === '') {
        error_flag.classList.add('hide');
        success_flag.classList.add('hide');
    }
};

