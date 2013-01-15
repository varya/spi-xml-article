$(function(){

    var $body = $('.body_i');

    $body.on('click', '.btn', function(e){
        $btn = $(e.target);
        $article = $btn.parent();

        if ($btn.hasClass('article_load')) {
            // Loading full text of the article
            $article.addClass('article--extended');
            $btn.removeClass('article_load').addClass('article_hide');
            $article.find('.article_text').transform({
                xml: 'data/article.xml',
                xsl: 'xsl/article.xsl',
                xslParams: {
                    articleId: $article[0].onclick().id
                }
            });
        } else {
            // toggle classes to hide or show
            $btn.toggleClass('article_hide').toggleClass('article_more');
            $article.toggleClass('article--extended');
        }

    });

    $body.transform({
        xml: 'data/list.xml',
        xsl: 'xsl/list.xsl'
    });

});
