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
    (function() {
      titleDinamicStyling($('#tm-products-slider .slide-info h3 a'));
      titleDinamicStyling($('#product h1'));
    })();
  </script>

  <!-- ------------------ -->

  </body>
</html>