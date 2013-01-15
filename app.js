$(function(){

    var $body = $('.body_i');

    $body.on('click', '.btn', function(e){
        $btn = $(e.target);
        $article = $btn.parent();

        if ($btn.hasClass('article_load')) {
            // Loading full text of the article
            $article.addClass('article--extended');
            $btn.removeClass('article_load').addClass('article_toggle').addClass('article_hide').text('hide');
            $article.find('.article_text').transform({
                xml: 'data/article.xml',
                xsl: 'xsl/article.xsl',
                xslParams: {
                    articleId: $article[0].onclick().id
                }
            });
        } else {
            $btn.text($btn.text() == 'more' ? 'hide' : 'more');
            $btn.toggleClass('article_hide').toggleClass('article_show');
            $article.toggleClass('article--extended');
        }

    });

    $body.transform({
        xml: 'data/list.xml',
        xsl: 'xsl/list.xsl'
    });

});
