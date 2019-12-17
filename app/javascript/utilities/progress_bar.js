document.addEventListener('turbolinks:load', () => {
    let next_question_btn = document.querySelector('.next-question-btn');
    if (next_question_btn) { progress_bar_proceed(next_question_btn) }
});

let progress_bar_proceed = (next_question_btn) => {
    let progress_bar = document.querySelector('.progress-bar');
    let progress = progress_bar.querySelector('.progress');

    let total_questions = next_question_btn.dataset.totalQuestionsCount;
    let questions_count = next_question_btn.dataset.questionNumber;

    let counter_params = {
        questions_count: questions_count,
        total_questions: total_questions,
        max_width: progress_bar.clientWidth,
        current_width: progress.clientWidth
    };

    progress.style.width = count_width(counter_params) + 'px';
};

let count_width = (params) => {
    let additional_percent = Math.ceil((params['questions_count'] / params['total_questions']) * 100)
    let additional_width = Math.ceil((params['max_width'] / 100) * additional_percent);

    let width_after_addition = params['current_width'] + additional_width;

    if (width_after_addition > params['max_width']) { return params['max_width'] }

    return width_after_addition;
};

