Class {
	#name : #BaselineOfWebSt,
	#superclass : #BaselineOf,
	#category : #BaselineOfWebSt
}

{ #category : #baselines }
BaselineOfWebSt >> baseline: spec [

	<baseline>
	spec
		baseline: 'Seaside3' with: [
			spec
				repository: 'github://SeasideSt/Seaside:master/';
				loads: #( 'Seaside-Pharo-Canvas' 'Seaside-Tests-Pharo-Canvas'
					   'Javascript-Pharo-Core' 'Javascript-Tests-Pharo-Core' ) ];
		baseline: 'PharoJS'
		with: [ spec repository: 'github://PharoJS/PharoJS:pharo11/' ];
		baseline: 'HydrogenComponentsJS'
		with: [ spec repository: 'github://bouraqadi/PharoJsMisc:pharo11' ].

	spec
		package: 'WebSt-Base'
		with: [
			spec requires: #( 'Seaside3' 'PharoJS' 'HydrogenComponentsJS' ) ];
		package: 'WebSt-Library' with: [ spec requires: #( 'WebSt-Base' ) ];
		package: 'WebSt-Examples'
		with: [ spec requires: #( 'WebSt-Base' 'WebSt-Library' ) ];
		package: 'WebSt-Tests'
		with: [
			spec requires: #( 'WebSt-Base' 'WebSt-Library' 'WebSt-Examples' ) ]
]
