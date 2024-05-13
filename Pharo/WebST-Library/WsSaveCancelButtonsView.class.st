Class {
	#name : #WsSaveCancelButtonsView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Buttons'
}

{ #category : #rendering }
WsSaveCancelButtonsView >> renderOuterHtmlOn: html [

	html button
		class: 'btn btn-success saveButton';
		type: 'button';
		value: 'Save'.
	html button
		class: 'btn btn-danger cancelButton';
		type: 'button';
		value: 'Cancel'
]
