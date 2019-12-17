document.addEventListener('turbolinks:load', () => {
    let question_data_input = document.querySelector('.question-data');

    if (question_data_input) { progress_bar_proceed(question_data_input) }
});

let progress_bar_proceed = (question_data_input) => {
    let progress_bar = document.querySelector('.progress-bar');
    let progress = progress_bar.querySelector('.progress');

    let total_questions = question_data_input.dataset.totalQuestionsCount;
    let questions_passed = question_data_input.dataset.questionNumber - 1;

    let counter_params = {
        questions_passed: questions_passed,
        total_questions: total_questions,
        max_width: progress_bar.clientWidth,
        current_width: progress.clientWidth
    };

    progress.style.width = count_width(counter_params) + 'px';
};

let count_width = (params) => {
    let additional_percent = Math.ceil((params['questions_passed'] / params['total_questions']) * 100);
    let additional_width = Math.ceil((params['max_width'] / 100) * additional_percent);

    let width_after_addition = params['current_width'] + additional_width;

    if (width_after_addition > params['max_width']) { return params['max_width'] }

    return width_after_addition;
};
