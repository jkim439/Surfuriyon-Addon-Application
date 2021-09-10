--local msg = "|cff00CC33Improved max. camera distance from 30 to 50"
local msg = "|cff00CC33ImprovedCamera: 카메라 원근 최대값을 기본 30에서 50으로 확장합니다"

for index, value in UIOptionsFrameSliders do


	if ( value.text == MAX_FOLLOW_DIST ) then


		value.maxValue = 3.4;

		value.tooltipText = OPTION_TOOLTIP_MAX_FOLLOW_DIST.."\n"

..msg;
	end

end