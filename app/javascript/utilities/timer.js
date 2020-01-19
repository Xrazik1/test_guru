document.addEventListener('turbolinks:load', () => {
    let timer_node = document.querySelector('.timer');

    if (timer_node) { init_timer(timer_node) }
});

let init_timer = (timer_node) => {
    let start_time     = timer_node.dataset.startTime;
    let end_time       = timer_node.dataset.endTime;

    let minutes_node   = timer_node.querySelector('.minutes');
    let seconds_node   = timer_node.querySelector('.seconds');

    let handle_time = () => {
        let wasted_time    = Math.trunc(Date.now() / 1000) - start_time;
        let remaining_time = end_time - start_time - wasted_time;

        if ( remaining_time <= 0) {
            window.location.replace(window.location.href + '/result');
        }else {
            remaining_time--;
            let humanized_time = seconds_to_human(remaining_time);

            minutes_node.innerHTML = humanized_time['minutes'];
            seconds_node.innerHTML = humanized_time['seconds'];
        }
    };

    setInterval( handle_time, 1000 );
};

let seconds_to_human = (secs) => ({
    minutes: Math.trunc(secs / 60),
    seconds: secs % 60
});
