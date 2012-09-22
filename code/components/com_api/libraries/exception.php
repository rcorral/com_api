<?php
/**
 * @package	API
 * @version 1.5
 * @author 	Brian Edgerton
 * @link 	http://www.edgewebworks.com
 * @copyright Copyright (C) 2011 Edge Web Works, LLC. All rights reserved.
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
*/

class ApiException extends JException
{
	public function toArray()
	{
		if ( !$this->code ) {
			$this->code = 400;
		}

		return ApiResource::getErrorResponse( $this->code, $this->message );
	}
}