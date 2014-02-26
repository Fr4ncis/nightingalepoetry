

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

    var init= function(){
        var isLast = false;

        $('.header-wrapper').append('<div class="call-menu"><a href="#" id="navaction">button here<a/></div>');

        $('.header-wrapper').on('click','#navaction',function(){
            $('.header').toggleClass('visible');
        });

        $('.verse .first').animate({
                opacity: 0.8
            },
            1500,
            function() {
                // console.log('animation complete');
            }
        );

        $('#accordion').accordion();


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
        init:init
    };

    return _this;
})();

$(nightingale.init);