{if !isset($content_only) || !$content_only}
              </div><!-- #center_column -->
              {if isset($left_column_size) && !empty($left_column_size)}
                <div id="left_column" class="column col-xs-12 col-sm-{$left_column_size|intval}">{$HOOK_LEFT_COLUMN}</div>
              {/if}
              </div><!--.row-->
            </div><!--.large-left-->
            {if isset($right_column_size) && !empty($right_column_size)}
              <div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
            {/if}
            </div><!-- .row -->
          </div><!-- .container -->
        </div><!-- #columns -->
        {assign var='displayMegaHome' value={hook h='tmMegaLayoutHome'}}
        {if isset($HOOK_HOME) && $HOOK_HOME|trim}
          {if $displayMegaHome}
            {hook h='tmMegaLayoutHome'}
          {else}
            <div class="container">
              {$HOOK_HOME}
            </div>
          {/if}
        {/if}
      </div><!-- .columns-container -->
      {assign var='displayMegaFooter' value={hook h='tmMegaLayoutFooter'}}
      {if isset($HOOK_FOOTER) || $displayMegaFooter}
        <!-- Footer -->
        <div class="footer-container">
          <footer id="footer">
            {if $displayMegaFooter}
              {$displayMegaFooter}
            {else}
              <div class="container">
                {$HOOK_FOOTER}
              </div>
            {/if}
          </footer>
        </div><!-- #footer -->
      {/if}
    </div><!-- #page -->
  {/if}

  {include file="$tpl_dir./global.tpl"}

  
  <!-- Dinamicly styling Elements.
  Really Sorry for that -->
  <script>
    /**
      Dynamic styling of slider's title on Homepage
    */
    (function() {
      titleDinamicStyling($('#tm-products-slider .slide-info h3 a'));
      titleDinamicStyling($('#product h1'));
    })();
    (function () {
        
    })
    /**
      Dynamic creation of popup window on Cart page for success buying
    */
//    (function () {
//      var confirmBtn = $('#new_account_form #submitAccount');
//
//      $(confirmBtn).on('click', function() {
//        setTimeout(function () {
//          if($('#opc_account_saved').css('display') == 'block') {
//             showModalSuccess ();
//          }
//        }, 2000)
//      })
//
//      function showModalSuccess () {
//        console.log($('#opc_account_saved').css('display'));
//
//        var view =  '<div id="dynamic-modal-success-confirm"><div class="wrap"><i class="fa fa-success"></i><h3>Спасибо за покупку!</h3><p style="margin-bottom: 50px;">Наш менеджер перезвонит Вам в ближайшее время и уточнит детали заказа.</p><a class="btn btn-default btn-sm icon-right" href="/">На главную</a></div></div>';
//
//        $('body').append(view);
//
//        $('#dynamic-modal-success-confirm .wrap').css({
//          'padding': '20px',
//          'border-radius': '10px',
//          'text-align': 'center',
//          'background': '#fff',
//          'max-width': '500px',
//          'width' : '90%',
//          'min-height' : '300px',
//          'vertical-align': 'middle',
//          'position': 'relative',
//          'top': 'calc(50% - 150px)',
//          'margin': '0 auto'
//        });
//
//        $('#dynamic-modal-success-confirm .wrap h3').css({
//          'color': '#77a03f',
//          'margin-bottom': '40px'
//        });
//
//        $('#dynamic-modal-success-confirm').css({
//          'display': 'none',
//          'position': 'fixed',
//          'z-index': '99999',
//          'width': '100%',
//          'height': '100%',
//          'top': 0,
//          'left': 0,
//          'background': 'rgba(0,0,0,.5)'
//        }).fadeIn();
//
//        setTimeout(function () {
//          $(location).attr('href', '/');
//        }, 7000);
//      }
//    })();
  </script>
  </body>
</html>