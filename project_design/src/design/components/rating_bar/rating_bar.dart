import 'package:flutter/material.dart';
import 'rating_bar.style.dart';

typedef RatingChangeCallback = void Function(double rating);

class RatingBar extends StatefulWidget {
  const RatingBar({
    super.key,
    required this.initialRating,
    this.starCount = 5,
    this.starSize = 24,
    this.onChanged,
    this.style,
  });

  final double initialRating;
  final int starCount;
  final double starSize;
  final RatingChangeCallback? onChanged;
  final RatingBarStyle? style;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double rating = 3.5;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = widget.style!;
    return StarRating(
      size: widget.starSize,
      rating: rating,
      color: currentStyle.color,
      borderColor: Colors.grey.shade400,
      allowHalfRating: false,
      emptyIcon: Icons.star,
      starCount: widget.starCount,
      onRatingChanged: (double rating) {
        return setState(() {
          this.rating = rating;
          widget.onChanged?.call(rating);
        });
      },
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({
    this.starCount = 5,
    this.rating = .0,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.size,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.allowHalfRating = false,
    this.filledIcon,
    this.halfFilledIcon,
    this.emptyIcon,
    super.key,
  });

  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final Color? borderColor;
  final double? size;
  final MainAxisAlignment mainAxisAlignment;
  final bool allowHalfRating;
  final IconData? filledIcon;
  final IconData? halfFilledIcon;
  final IconData? emptyIcon;

  Widget buildStar(BuildContext context, int index) {
    IconData iconData;
    if (index >= rating) {
      iconData = emptyIcon ?? Icons.star_border;
    } else if (index > rating - 1 && index < rating) {
      iconData = halfFilledIcon ?? Icons.star_half;
    } else {
      iconData = filledIcon ?? Icons.star;
    }

    Icon icon = Icon(
      iconData,
      color: index >= rating ? borderColor ?? Colors.grey : color ?? Colors.yellow,
      size: size,
    );

    return InkResponse(
      highlightColor: Colors.transparent,
      radius: 0,
      //radius: size ?? MediaQuery.of(context).size.width / starCount / 2,
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      onLongPress: allowHalfRating && onRatingChanged != null ? () => onRatingChanged!(index + 0.5) : null,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: List.generate(starCount, (index) => buildStar(context, index)),
        ),
      ),
    );
  }
}
