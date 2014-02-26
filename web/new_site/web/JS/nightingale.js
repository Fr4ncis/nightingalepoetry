

window.requestAnimFrame = (function(callback) {
    return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
        function(callback) {
        window.setTimeout(callback, 1000 / 60);
    };
})();

// TO DO
// Width detetion to manage mobile devices
//
//

var nightingale = (function(){
    var muse = {};


    init1 = function(){
        muse.canvas = $('#poem-blackboard')[0];
        muse.context = muse.canvas.getContext('2d');

        muse.letterno = 0;
        muse.lineno = 0;
        muse.xpos = 10;
        muse.initialxpos = muse.xpos;
        muse.initialypos = 20;
        muse.ypos = 10;
        muse.incrementx = 12;
        muse.incrementy = 35;
        muse.pause = 100;
        muse.content= [
            'Asparagus, you timely shoot,',
            'You portent of the spring',
            'Volley through the goldern dew,',
            'Pierce your purple blazing sting;',
            'Spear the cloying mud and grass,',
            'Burst them with your mast,',
            'Break into the waking summer,',
            'Brave until the last.'
        ];

        // set font etc
        muse.context.font = "20pt Kaushan Script";
        //context.font = "font-family: 'Kaushan Script', cursive;"
        animate(muse);
    };

    function animate(muse) {
        var nextLetter = "";
        muse.pause = 100;
        // get content line

        if (muse.letterno === 0 && muse.lineno === 0){
            muse.ypos = muse.ypos + muse.initialypos;
        }

        if(muse.content[muse.lineno].length === muse.letterno + 1){
            muse.pause = 500;
        }

        if(muse.content[muse.lineno].length < muse.letterno + 1){
            muse.lineno = muse.lineno + 1;
            muse.letterno = 0;
            muse.ypos = muse.ypos + muse.incrementy;
            muse.xpos = muse.initialxpos;

        }

        if(muse.content.length <= muse.lineno){
            // exit if at end of content
            return;
        }

        nextLetter = muse.content[muse.lineno][muse.letterno];
        muse.letterno = muse.letterno + 1;
        muse.context.fillText(nextLetter, muse.xpos, muse.ypos);
        muse.xpos = muse.xpos + muse.incrementx;
        muse.context.stroke();

        // console.log(muse.pause);
        window.setTimeout(
            function(){
                animate(muse);
            },
            muse.pause
        );

        // request new frame
        // requestAnimFrame(function() {
        //     animate(muse);
        // });
    }

    var init2 = function(){
        var isLast = false;

        $('.header-wrapper').append('<div class="call-menu"><a href="#">button here<a/></div>');

        $('.verse .first').animate({
                opacity: 0.8
            },
            1500,
            function() {
                // console.log('animation complete');
            }
        );


        var animateWord = function($words, index){
            var $curword = $($words[index]);
            if(!isLast){
                if($curword.css('opacity') > 0){
                    animateWord($words, index + 1);
                }
                else{
                    if($curword.hasClass('end')){
                        isLast = true;
                        var $curLine = $curword.parent();
                        $curLine.next('.line').addClass('active');
                        if($curLine.next('.line').length === 0){
                            var $nextverse = $curLine.parent().next('.verse').find('.line');
                            $($nextverse[0]).addClass('active');
                        }
                    }
                    $($words[index]).animate(
                        {
                            opacity: 0.8
                        },
                        100,
                        "easeInCirc",
                        function() {
                            if($words.length <= index + 1){
                                $nextWords = $words.parent().next('.line').find('.word');
                                window.setTimeout(function(){
                                    animateWord($nextWords,0);
                                },30);

                            }
                            else{
                                animateWord($words,index+1);
                            }
                        }
                    );
                }
            }
        };

        $('.poem-display').on('mouseover','.active .word',function(){
            var $this = $(this),
                $line = $this.parent(),
                $words = $line.find('.word');

            isLast = false;

            // need to check if the previous line is visible.
            animateWord($words,0);

        });

    };

    var _this = {
        init1:init1,
        init2:init2
    };

    return _this;
})();

$(
    function(){
        if($('#poem-blackboard').length > 0){
            nightingale.init1();
        }
        else{
            nightingale.init2();
        }

    }
);