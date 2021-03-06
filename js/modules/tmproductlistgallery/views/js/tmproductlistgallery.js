/*
* 2002-2016 TemplateMonster
*
* TM Product List Gallery
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade the module to newer
* versions in the future.
*
* @author     TemplateMonster
* @copyright  2002-2016 TemplateMonster
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*/

$(window).load(function() {

  if (TM_PLG_TYPE == 'slideshow') {
    tm_slideshow();
    $(document).on("mousedown", ".sortPagiBar li", function () {
      $('.tmproductlistgallery-images:visible').slick('unslick');
      $('.tmproductlistgallery-thumbnails:visible').slick('unslick');
    });
    $(document).on("click", "#home-page-tabs > li", function () {
      tm_slideshow();
    });
    if ($('body#index').length) {
      $(document).arrive("#old_center_column + #center_column .product_list li:last-child > div", function () {
        tm_slideshow();
      });
    } else {
      $(document).arrive(".product_list li:last-child > div", function () {
        tm_slideshow();
      });
    }
  } else {
    rollover();
    window.onresize = function (){
      rollover();
    }
  }
});

function rollover() {
  if (TM_PLG_TYPE == 'rollover') {
    $(document).on('mouseenter', '.product-image-container', function () {
      if (TM_PLG_ROLLOVER_ANIMATION == 'opacity') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().animate({opacity: 0});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().animate({opacity: 1});
      } else if (TM_PLG_ROLLOVER_ANIMATION == 'horizontal_slide') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().css('left', 0).animate({left: '-100%'});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().css({
          left: '100%',
          opacity: 1
        }).animate({left: 0});
      } else if (TM_PLG_ROLLOVER_ANIMATION == 'vertical_slide') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().css('top', 0).animate({top: '100%'});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().css({
          top: '-100%',
          opacity: 1
        }).animate({top: 0});
      }
    });
    $(document).on('mouseleave', '.product-image-container', function () {
      if (TM_PLG_ROLLOVER_ANIMATION == 'opacity') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().animate({opacity: 1});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().animate({opacity: 0});
      } else if (TM_PLG_ROLLOVER_ANIMATION == 'horizontal_slide') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().animate({left: '0'});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().animate({left: '100%'});
      } else if (TM_PLG_ROLLOVER_ANIMATION == 'vertical_slide') {
        $(this).find('.tmproductlistgallery.rollover').find('.cover-image').stop().animate({top: '0'});
        $(this).find('.tmproductlistgallery.rollover').find('.rollover-hover').stop().animate({top: '-100%'});
      }
    });
  }
}

function tm_slideshow() {
  if (TM_PLG_TYPE == 'slideshow') {
    setTimeout(function(){
      $('.product-image-container').each(function () {
        if (TM_PLG_USE_THUMBNAILS) {
          var tmplgNavigation = $(this).find('.tmproductlistgallery-thumbnails:visible');
        }

        slider = $(this).find('.tmproductlistgallery-images:not(.slick-initialized):visible').slick({
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: arrows,
          infinite: infinite,
          dots: dots,
          asNavFor: tmplgNavigation
        });
      });
      if (TM_PLG_USE_THUMBNAILS) {
        $('.product-image-container').each(function () {
          var tmplgSlideshow = $(this).find('.tmproductlistgallery-images:visible');
          slider2 = $(this).find('.tmproductlistgallery-thumbnails:not(.slick-initialized):visible').slick({
            slidesToShow: TM_PLG_NB_THUMBNAILS,
            slidesToScroll: TM_PLG_NB_SCROLL_THUMBNAILS,
            infinite: infiniteThumb,
            asNavFor: tmplgSlideshow,
            dots: dotsThumb,
            centerMode: centerThumb,
            centerPadding: false,
            focusOnSelect: true,
            vertical: vertical,
            verticalSwiping: vertical,
            arrows: arrowsThumb
          });
        });
      }
    }, 100);
  }
}

$(document).ready(function() {
  if (TM_PLG_TYPE == 'slideshow') {
    if (TM_PLG_INFINITE) {
      infinite = true;
    } else {
      infinite = false;
    }
    if (TM_PLG_USE_PAGER) {
      dots = true;
    } else {
      dots = false;
    }
    if (TM_PLG_USE_CONTROLS) {
      arrows = true;
    } else {
      arrows = false;
    }
    if (TM_PLG_USE_THUMBNAILS) {
      if (TM_PLG_INFINITE && TM_PLG_USE_CAROUSEL) {
        infiniteThumb = true;
      } else {
        infiniteThumb = false;
      }
      if (TM_PLG_USE_PAGER_THUMBNAILS && TM_PLG_USE_CAROUSEL) {
        dotsThumb = true;
      } else {
        dotsThumb = false;
      }
      if (TM_PLG_USE_CONTROLS_THUMBNAILS && TM_PLG_USE_CAROUSEL) {
        arrowsThumb = true;
      } else {
        arrowsThumb = false;
      }
      if (TM_PLG_CENTERING_THUMBNAILS && TM_PLG_USE_CAROUSEL) {
        centerThumb = true;
      } else {
        centerThumb = false;
      }
      if (TM_PLG_POSITION_THUMBNAILS =='vertical') {
        vertical = true;
        window.onresize = function (){
          $('.tmproductlistgallery-thumbnails:visible').slick('setPosition');
        }
      } else {
        vertical = false;
      }
    }
  }
});

