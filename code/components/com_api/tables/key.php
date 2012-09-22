<?php
/**
 * @package	API
 * @version 1.5
 * @author 	Brian Edgerton
 * @link 	http://www.edgewebworks.com
 * @copyright Copyright (C) 2011 Edge Web Works, LLC. All rights reserved.
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
*/

// no direct access
defined('_JEXEC') or die;

class ApiTableKey extends JTable
{
	
	var $id			= null;
	var $user_id	= null;
	var $hash		= null;
	var $domain		= null;
	var $created	= null;
	var $created_by	= null;
	var $published	= null;

	/**
	 * @param	JDatabase	A database connector object
	 */
	function __construct(&$db)
	{
		parent::__construct('#__api_keys', 'id', $db);
	}
}