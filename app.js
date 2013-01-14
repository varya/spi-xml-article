$(function(){

    var $body = $('.body_i');

    $body.on('click', '.article_load', function(e){
        $btn = $(e.target);
        $article = $btn.parent();

        $article.addClass('article-extended');
        $btn.removeClass('article_load').addClass('article_toggle').text('hide');
        $article.find('.article_text').transform({
            xml: 'data/article.xml',
            xsl: 'xsl/article.xsl',
            xslParams: {
                articleId: $article[0].onclick().id
            }
        });
    });

    $body.on('click', '.article_toggle', function(e){
        $btn = $(e.target);
        $btn.text($btn.text() == 'more' ? 'hide' : 'more');
        $btn.parent().toggleClass('article-extended')
    });

    $body.transform({
        xml: 'data/list.xml',
        xsl: 'xsl/list.xsl'
    });

});
