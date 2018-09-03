{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
	<div class="col-md-12 pr-0 row">
		<div class="col-12 col-sm-12 col-md-8">
			<div class="moduleIcon">
				<span class="o-detail__icon js-detail__icon userIcon-{$MODULE}"></span>
			</div>
			<div class="pl-1">
				<div class="d-flex flex-nowrap align-items-center js-popover-tooltip" data-ellipsis="true" data-content="{$RECORD->getName()}" data-toggle="popover" data-js="tooltip">
					<h4 class="js-recordLabel h6 pushDown marginbottomZero js-popover-text">
						<span class="modCT_{$MODULE_NAME}">{$RECORD->getName()}</span>
					</h4>
					<span class="fas fa-info-circle fa-sm js-popover-icon d-none"></span>
					{assign var=RECORD_STATE value=\App\Record::getState($RECORD->getId())}
					{if $RECORD_STATE !== 'Active'}
						{assign var=COLOR value=AppConfig::search('LIST_ENTITY_STATE_COLOR')}
						<span class="badge badge-secondary u-h-fit ml-1" {if $COLOR[$RECORD_STATE]}style="background-color: {$COLOR[$RECORD_STATE]};"{/if}>
							{if \App\Record::getState($RECORD->getId()) === 'Trash'}
								{\App\Language::translate('LBL_ENTITY_STATE_TRASH')}
							{else}
								{\App\Language::translate('LBL_ENTITY_STATE_ARCHIVED')}
							{/if}
						</span>
					{/if}
				</div>
				{assign var=RELATED_TO value=$RECORD->get('linktoaccountscontacts')}
				{if !empty($RELATED_TO)}
					<div class="js-popover-tooltip d-flex flex-nowrap" data-ellipsis="true" data-content="{$RECORD->getDisplayValue('linktoaccountscontacts')}" data-toggle="popover" data-js="tooltip">
						<span class="mr-1 text-muted u-white-space-nowrap">{\App\Language::translate('Related to',$MODULE_NAME)}
							:</span>
						<span class="js-popover-text">{$RECORD->getDisplayValue('linktoaccountscontacts')}</span>
						<span class="fas fa-info-circle fa-sm js-popover-icon d-none"></span>
					</div>
				{/if}
				<div class="js-popover-tooltip d-flex flex-nowrap" data-ellipsis="true" data-content="{$RECORD->getDisplayValue('assigned_user_id')}" data-toggle="popover" data-js="tooltip">
				<span class="mr-1 text-muted u-white-space-nowrap">
						{\App\Language::translate('Assigned To',$MODULE_NAME)}:</span>
					<span class="js-popover-text">{$RECORD->getDisplayValue('assigned_user_id')}</span>
					<span class="fas fa-info-circle fa-sm js-popover-icon d-none"></span>
				</div>
				{assign var=SHOWNERS value=$RECORD->getDisplayValue('shownerid')}
				{if $SHOWNERS != ''}
					<div class="js-popover-tooltip d-flex flex-nowrap" data-ellipsis="true" data-content='{$SHOWNERS}' data-toggle="popover" data-js="tooltip">
						<span class="mr-1 text-muted u-white-space-nowrap">{\App\Language::translate('Share with users',$MODULE_NAME)}
							:</span>
						<span class="js-popover-text">{$SHOWNERS}</span>
						<span class="fas fa-info-circle fa-sm js-popover-icon d-none"></span>
					</div>
				{/if}
			</div>
		</div>
		{include file=\App\Layout::getTemplatePath('Detail/HeaderFields.tpl', $MODULE_NAME)}
	</div>
{/strip}
